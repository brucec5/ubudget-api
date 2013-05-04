class AddOtherDurationToBudgets < ActiveRecord::Migration
  def change
    add_column :budgets, :other_duration, :integer
  end
end
