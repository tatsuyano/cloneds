class TasksController < ApplicationController
  before_action :set_user_and_task, only: [:edit, :update, :destroy]

  def create
    @user = User.find(params[:user_id])
    @task = @user.tasks.find_or_create_by(task_params)
    redirect_to controller: 'users', action: 'show', rand_code: @user.rand_code
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to controller: 'users', action: 'show', rand_code: @user.rand_code
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to controller: 'users', action: 'show', rand_code: @user.rand_code
  end

  private
  def set_user_and_task
    @task = Task.find(params[:id])
    @user = @task.user
  end
  def task_params
    params.require(:task).permit(:title)
  end
end
