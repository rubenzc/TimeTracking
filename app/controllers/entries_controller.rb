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

  def new
    #El project_id viene a través de la uri
    @project = Project.find params[:project_id]
    #Inicializas la entrada
    @entry = @project.entries.new
  end

  def create
    #Find the project
    @project = Project.find params[:project_id]
    #New entry for that project with attributes from params[:entry]
    @entry = @project.entries.new entry_params
    #Try to save it
    if@entry.save
      redirect_to action: :index, project_id: @project.id
    else
      render 'new'
    end
  end
  #Con este método filtro a través de los strong parameters
  #que no accedan más variables de las que yo quiero

  def entry_params
    params.require(:entry).permit(:hours, :minutes, :date)
  end

end
