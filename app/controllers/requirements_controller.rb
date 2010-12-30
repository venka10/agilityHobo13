class RequirementsController < ApplicationController

  hobo_model_controller

  # add this to remove the Requirement tab from the main navigation bar 
  auto_actions :all, :except=> :index
 
  # add this line to get a New Requirement link for the Project page
  auto_actions_for :project, [:new, :create]

end
