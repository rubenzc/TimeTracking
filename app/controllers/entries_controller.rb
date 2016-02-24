class EntriesController < ApplicationController
  def index
    #Recoge todos los parama
    @project =Project.find params[:project_id]
    @entries = @project.entries

    date = Date.today
    @current_month_hours = @project.total_hours_in_month(date.month, date.year)
    # @current_month_hours = Project.find[:hours]
  end

  def show
    @project = Project.find params [:id]
  end
end
