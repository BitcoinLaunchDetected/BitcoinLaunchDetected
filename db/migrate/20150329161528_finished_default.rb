class FinishedDefault < ActiveRecord::Migration
  def change
    change_column_default :transactions, :finished, false
  end
end
