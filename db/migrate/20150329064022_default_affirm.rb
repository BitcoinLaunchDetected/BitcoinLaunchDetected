class DefaultAffirm < ActiveRecord::Migration
  def change
    change_column_default :transactions, :affirmed, 0
  end
end
