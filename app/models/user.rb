class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :initiated_transactions, class_name: 'Transaction', foreign_key: 'sender_id'
  has_many :received_transactions, class_name: 'Transaction', foreign_key: 'recipient_id'

  def affirm
    init = user.initiated_transactions.where(sender_affirm: false)
    recip = user.received_transactions.where(recip_affirm: false)

    if init.any?
      init.first.update(sender_affirm: true)
    elsif recip.any?
      recip.first.update(recip_affirm: true)
    end
  end
end
