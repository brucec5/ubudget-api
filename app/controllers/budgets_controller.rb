class BudgetsController < ApplicationController

  # GET /budgets
  # Get a list of the current user's budgets
  def index
    budgets = current_user.budgets
    render :json => budgets
  end

  # GET /budgets/with_entries
  # Gets a list of the current user's budgets, including their entries
  def with_entries
    budgets = current_user.budgets.includes(:entries)
    render :json => budgets.as_json(:include => :entries)
  end

  # GET /budgets/1
  # Get only the requested budget
  def show
    budget = Budget.find(params[:id])
    render :json => budget
  end

  # POST /budgets
  # Creates a new budget, returning the ID in JSON.
  def create
    budget = Budget.new(params.slice(:budget_name, :amount, :recur, :start_date,
                                     :recurrence_duration, :other_duration))
    budget.user = current_user

    if budget.save
      render :json => budget, :status => :created
    else
      render :json => budget.errors, :status => :unprocessable_entity
    end
  end

  # PUT /budgets/1
  # Updates a budget, returning success or failure
  def update
    budget = Budget.find(params[:id])

    if budget.update_attributes(params.slice(:budget_name, :amount, :recur,
                                             :start_date, :recurrence_duration,
                                             :other_duration))
      render :json => budget
    else
      render :json => entry.errors, :status => :unprocessable_entity
    end
  end

  # DELETE /budgets/1
  # Destroys a given budget, along with all of its entries
  def destroy
    budget = Budget.find(params[:id])

    budget.destroy

    render :json => { :destroyed => true }
  end
end
