class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :budget

      t.integer :amount
      t.text :notes
      t.date :expenditure_date

      t.timestamps
    end
  end
end
