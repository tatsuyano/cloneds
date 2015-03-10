class ScoresController < ApplicationController
  before_action :set_user, only: [:index]
  before_action :set_task, only: [:index]

  def index
    Score.count_up_or_down(@user.id,@task.id)
    redirect_to controller: 'users', action: 'show', rand_code: @user.rand_code
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
  def set_task
    @task = Task.find(params[:task_id])
  end
end
