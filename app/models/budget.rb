class Budget < ActiveRecord::Base
  attr_accessible :budget_name, :amount, :recur, :start_date, :recurrence_duration, :other_duration

  VALID_RECURRENCE_DURATIONS = [
    "DAY",
    "WEEK",
    "FORTNIGHT",
    "MONTH",
    "YEAR",
    "OTHER"
  ]

  has_many :entries, :dependent => :destroy
  belongs_to :user

  validates_presence_of :budget_name
  validates_presence_of :recurrence_duration
  validates_presence_of :start_date
  validates_inclusion_of :recurrence_duration, :in => VALID_RECURRENCE_DURATIONS
  validates :amount, :numericality => { :greater_than => 0 }

  # Validates if the recurrence is OTHER and other_duration is positive
  validates :other_duration,
    :numericality => { :greater_than => 0 },
    :if => Proc.new { |b| b.recurrence_duration == "OTHER" }

  def as_json(*args)
    hash = super(*args)

    sum = entries.reduce(0) { |acc, e| acc + e.amount }

    hash["budget"].merge!("current_amount" => sum)
  end
end
