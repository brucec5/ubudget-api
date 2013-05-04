class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.references :user

      t.string :budget_name
      t.integer :amount
      t.integer :amount_so_far, :default => 0
      t.boolean :recur
      t.datetime :start_date
      t.string :recurrence_duration

      t.timestamps
    end
  end
end
