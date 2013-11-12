class AddStyleToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :style, :string
  end
end
