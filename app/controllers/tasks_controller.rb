class TasksController < ApplicationController
  before_action :task_finder, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_task
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_task
  end

  def destroy
    @task.destroy
    redirect_to "/tasks"
  end

  private

  def redirect_task
    redirect_to task_path(@task)
  end

  def task_finder
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :compleated)
  end
end
