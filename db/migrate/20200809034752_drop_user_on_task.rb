class DropUserOnTask < ActiveRecord::Migration[6.0]
  def change
    # There's no need to have this reference, a task belongs to a project and a project to a user
    remove_column :tasks, :user_id
  end
end
