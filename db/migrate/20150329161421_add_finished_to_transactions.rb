class AddFinishedToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :finished, :boolean
  end
end
