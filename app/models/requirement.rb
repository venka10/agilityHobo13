class Requirement < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title  :string
    body   :html
    timestamps
  end

  belongs_to :project, :index=>'requirement_project_index'
  belongs_to :status, :class_name => "RequirementStatus", :index => 'requirement_status_index'
    
  has_many :tasks, :dependent=>:destroy, :order=>:position
  
  children :tasks

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    ((acting_user.signed_up? && acting_user.role == "coordinator") or acting_user.administrator?) && !project_changed?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
