class Project < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    timestamps
  end
  
  has_many :requirements, :dependent=>:destroy
  
  children :requirements

  # --- Permissions --- #

  def create_permitted?
    # Make sure the user is 1) Signed up and a Coordinator or 2) is an                                                                                                 
    # Adminstrator
   (acting_user.signed_up? &&  acting_user.role=="Coordinator") || acting_user.administrator?
  end

  def update_permitted?
    # Make sure the user is 1) Signed up and a Coordinator or 2) is an      
    # Adminstrator
   (acting_user.signed_up? &&  acting_user.role=="Coordinator") || acting_user.administrator?
  end


  def destroy_permitted?
    #acting_user.administrator?
    false
  end

  def view_permitted?(field)
    true
  end

end
