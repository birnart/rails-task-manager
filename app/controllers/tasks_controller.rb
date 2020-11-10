class TasksController < ApplicationController
  # before_action :task_finder, only: [:show, :edit, :update, :destroy]

  def list
    @tasks = Task.all
  end

  def details
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to "/list"
  end

  private

  # def task_finder
  #   @restaurant = Task.find(params[:id])
  # end

  def task_params
    params.require(:task).permit(:title, :details, :compleated)
  end
end
