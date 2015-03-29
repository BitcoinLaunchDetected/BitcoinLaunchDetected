class Transaction < ActiveRecord::Base
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  def affirmed?
    self.sender_affirm and self.recip_affirm
  end
end
