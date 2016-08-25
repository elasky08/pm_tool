class DeleteTaskToProject < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :task_id
  end
end
