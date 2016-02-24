class ProjectsController < ApplicationController
  def index
    @projects = Project.last_created_projects(10)
    if @projects.empty?
      render 'site/no_project'
    end
  end

  def show
    @project = Project.find_by(id: params[:id]) || render_404(params)
  end

end
