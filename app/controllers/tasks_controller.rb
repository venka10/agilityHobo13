class TasksController < ApplicationController

  hobo_model_controller

  auto_actions :write_only,:edit

  # Add the following to put an in-place editor within the Requirement page
  auto_actions_for :requirement, :create
  
end
