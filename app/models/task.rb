class Task < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    timestamps
  end
  
  belongs_to :requirement, :index=>'requirement_task_index'
  has_many :task_assignments, :dependent=>:destroy
  has_many :users, :through=>:task_assignments

  children :users, :task_assignments
  
  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
