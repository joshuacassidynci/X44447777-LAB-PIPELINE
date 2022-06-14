class Todo < ApplicationRecord

  def get_todo_status
    if(self.completed)
      return "Completed"
    else
      return "In Progress"
    end
  end

end
