class AddAffirmedToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :affirmed, :integer
  end
end
