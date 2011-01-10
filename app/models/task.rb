class Task < ActiveRecord::Base

  hobo_model # Don't put anything above this
  acts_as_list :scope => :requirement

  fields do
    name :string
    due_date :date
    timestamps
  end
  
  validates_date :due_date, :on_or_after => Date.today

  belongs_to :requirement, :index=>'requirement_task_index'
  has_many :task_assignments, :dependent=>:destroy
  has_many :users, :through=>:task_assignments, :accessible=>true

  children  :task_assignments,:users
  
  
  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    ((acting_user.signed_up? && acting_user.role == "coordinator") or   acting_user.administrator?) && !requirement_changed?
  end


  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
