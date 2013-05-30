class EntriesController < ApplicationController

  # GET /entries
  # Gets a list of all of the current user's entries
  def index
    entries = current_user.entries
    render :json => entries
  end

  # GET /entries/1
  # Gets only the requested entry
  def show
    entry = Entry.find(params[:id])
    render :json => entry
  end
  
  # GET /entries/1/by_budget
  # Gets all entries with a given budget id
  def by_budget
    entries = Entry.where(:budget_id => params[:id])
    render :json => entries
  end

  # POST /entries
  # Creates a new entry, returning the ID in JSON.
  def create
    entry = Entry.new(params.slice(:amount, :notes, :expenditure_date, :budget_id))

    if entry.save
      render :json => entry, :status => :created
    else
      render :json => entry.errors, :status => :unprocessable_entity
    end
  end

  # PUT /entries/1
  # Updates an entry, returning success or failure
  def update
    entry = Entry.find(params[:id])

    if entry.update_attributes(params.slice(:amount, :notes, :expenditure_date, :budget_id))
      render :json => entry
    else
      render :json => entry.errors, :status => :unprocessable_entity
    end
  end

  # DELETE /budgets/1
  # Destroys a given entry
  def destroy
    entry = Budget.find(params[:id])

    entry.destroy

    render :json => { :destroyed => true }
  end
end
