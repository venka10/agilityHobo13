class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :requirements do |t|
      t.string   :title
      t.text     :body
      t.string   :status
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :project_id
    end
    add_index :requirements, [:project_id], :name => 'requirement_project_index'

    create_table :tasks do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :requirement_id
    end
    add_index :tasks, [:requirement_id], :name => 'requirement_task_index'

    create_table :task_assignments do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :user_id
      t.integer  :task_id
    end
    add_index :task_assignments, [:user_id], :name => 'assignment_user_join_index'
    add_index :task_assignments, [:task_id], :name => 'assignment_task_join_index'
  end

  def self.down
    drop_table :projects
    drop_table :requirements
    drop_table :tasks
    drop_table :task_assignments
  end
end
