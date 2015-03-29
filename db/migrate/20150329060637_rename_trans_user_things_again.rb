class RenameTransUserThingsAgain < ActiveRecord::Migration
  def change
    rename_column :transactions, :sender, :sender_id
    rename_column :transactions, :recipient, :recipient_id
  end
end
