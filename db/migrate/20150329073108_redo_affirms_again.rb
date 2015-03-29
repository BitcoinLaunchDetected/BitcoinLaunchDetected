class RedoAffirmsAgain < ActiveRecord::Migration
  def change
    remove_column :transactions, :sender_affirm
    add_column :transactions, :sender_affirm, :boolean, default: false

    remove_column :transactions, :recip_affirm
    add_column :transactions, :recip_affirm, :boolean, default: false
  end
end
