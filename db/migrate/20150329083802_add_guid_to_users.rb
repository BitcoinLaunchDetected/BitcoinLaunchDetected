class AddGuidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :guid, :text
  end
end
