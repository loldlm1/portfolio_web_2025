class WebProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_web_project, only: %i[show edit update destroy]

  def index
    @web_projects = WebProject.all.order(created_at: :desc)
  end

  def show; end

  def new
    @web_project = current_user.web_projects.new
  end

  def edit; end

  def create
    @web_project = current_user.web_projects.new(web_project_params)
    if @web_project.save
      redirect_to @web_project, notice: "Proyecto creado con éxito."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @web_project.update(web_project_params)
      redirect_to @web_project, notice: "Proyecto actualizado."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @web_project.destroy
    redirect_to web_projects_url, notice: "Proyecto eliminado."
  end

  private

  def set_web_project
    @web_project = WebProject.find(params[:id])
  end

  def web_project_params
    params.require(:web_project).permit(:title, :description, :image)
  end
end
