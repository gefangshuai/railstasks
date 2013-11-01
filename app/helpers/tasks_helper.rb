module TasksHelper
  def exist_style task
    if !task.style
      task.style = callout_sample
    end 
    task
  end
end
