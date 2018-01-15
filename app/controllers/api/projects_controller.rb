class Api::ProjectsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Project.where(user: user)
  end

  def show
    project = Project.find(params[:id])
    if request.headers[:tasks] == 'include'
      render json: project.to_json(:methods => :tasks)
    else
      render json: project.to_json(:methods => :task_count)
    end
  end

  def create
    @project = Project.new(project_params)
    @project.user = user

    if @project.save
      render json: @project
    else
      render json: @project.errors
    end
  end

  def destroy
    @project = Project.find(params[:id])

    if @project.user != user
      payload = {
        error: "You don't own this project",
        status: 400
      }
      render :json => payload, :status => :bad_request
      
    elsif @project.task_count > 0
      payload = {
        error: "Project contains tasks",
        status: 400
      }
      render :json => payload, :status => :bad_request

    else
      @project.destroy
      render :json => 'OK'
    end
  end

  def user
     User.find_by token: (request.headers[:token] || params[:token])
  end

  private

  def project_params
    params.permit(:name, :id)
  end

end
