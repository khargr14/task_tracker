class CreateTasksTable < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string   :title
      t.integer  :user_id
  end
  end
end
