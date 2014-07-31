class ProjectsController < ApplicationController

  layout "home_template", only: [:new, :edit, :create, :show, :index]
  
  def index
    @projects = Project.all
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(params_projects)
    @project.save
    redirect_to @project
  end
   
  def show
    @project = Project.find(params[:id])
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    @project.update(params_projects)
    redirect_to @project
  end
  
  private
  
  def params_projects
    params.require(:project).permit(:title)
  end
  
  def find_project
    @project=Project.find(params[:id])
  end 
end
