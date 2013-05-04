class Entry < ActiveRecord::Base
  attr_accessible :amount, :expenditure_date, :notes, :budget_id

  belongs_to :budget

  validates :amount, :numericality => { :greater_than => 0 }
  validates_presence_of :expenditure_date
  validates_presence_of :budget
end
