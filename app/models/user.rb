class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :initiated_transactions, class_name: 'Transaction', foreign_key: 'sender_id'
  has_many :received_transactions, class_name: 'Transaction', foreign_key: 'recipient_id'

  def unfinished_transactions
    init = self.initiated_transactions.where("affirmed < ?", 2)
    recv = self.receieved_transactions.where("affirmed < ?", 2)

    init + recv
  end
end
