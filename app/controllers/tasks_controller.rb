class TasksController < ApplicationController

  def index
    user_id = params[:user_id]  
    @user = User.find(user_id)  
    @tasks =  @user.tasks   

  end
  
  def new
    user_id = params[:user_id]  
    @user = User.find(user_id)  
    @task = Task.new    
  end

  def create
    user_id = params[:user_id]
    @task = Task.new(task_params)
    @task.style = callout_sample
    if @task.save 
      flash['success'] = '任务添加成功！'      
      redirect_to :action => 'index' # Handle a successful save    
    else
      flash['danger'] = '任务添加失败！' + @task.errors.full_messages.join(', ')  
      render 'new'
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :content)
  end

  def callout_sample
    calout = ['danger','info','warning','success','primary'].sample
  end
end
