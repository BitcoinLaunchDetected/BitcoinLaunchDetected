class RedoAffirms < ActiveRecord::Migration
  def change
    remove_column :transactions, :affirmed
    add_column :transactions, :sender_affirm, :integer
    add_column :transactions, :recip_affirm, :integer
  end
end
