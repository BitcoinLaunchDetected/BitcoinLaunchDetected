class RenameTransactionUserIds < ActiveRecord::Migration
  def change
    rename_column :transactions, :user1_id, :sender
    rename_column :transactions, :user2_id, :recipient
  end
end
