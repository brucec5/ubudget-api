class ChangeBudgetStartDateToDate < ActiveRecord::Migration
  def up
    change_column :budgets, :start_date, :date
  end

  def down
    change_column :budgets, :start_date, :date
  end
end
