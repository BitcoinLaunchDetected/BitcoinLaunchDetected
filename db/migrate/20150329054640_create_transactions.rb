class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user1_id
      t.integer :user2_id
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
