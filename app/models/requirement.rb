class Requirement < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title  :string
    body   :text
    status :string
    timestamps
  end

  belongs_to :project, :index=>'requirement_project_index'
  has_many :tasks, :dependent=>:destroy
  
  children :tasks

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
