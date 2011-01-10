class ProjectsController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def show
    @project = find_instance
    @reqlist = @project.requirements.where(["title like ?","%#{params[:search]}%"]).order(parse_sort_param(:title, :status).try.join(' '))
  end


end
