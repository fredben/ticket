class ProjectsController < ApplicationController
  before_action :set_project, only: [:show,:edit,:update,:destroy]
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
      flash[:alert] = "Project has not been created."
      render "new"
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = "Project has been update"
      redirect_to @project
    else
      flash[:alert] = "Project has not been update"
      render "edit"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "Project has been destroyed"
    redirect_to projects_path
  end

  private
    def set_project
      #@project = Project.find(params[:id])
      #cambiamos por la anidación
      @project = Project.find(params[:project_id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "El proyecto en el que estabas buscando no se encuentra"
      redirect_to projects_path
    end

    def project_params
      params.require(:project).permit(:name,:description)
    end
end
