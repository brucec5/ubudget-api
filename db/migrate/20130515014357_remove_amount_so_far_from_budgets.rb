class RemoveAmountSoFarFromBudgets < ActiveRecord::Migration
  def up
    remove_column :budgets, :amount_so_far
  end

  def down
    add_column :budgets, :amount_so_far, :integer, :default => 0
  end
end
