# This is an auto-generated file: don't edit!
# You can add your own routes in the config/routes.rb file
# which will override the routes in this file.

Projects::Application.routes.draw do


  # Resource routes for controller "projects"
  get 'projects(.:format)' => 'projects#index', :as => 'projects'
  get 'projects/new(.:format)', :as => 'new_project'
  get 'projects/:id/edit(.:format)' => 'projects#edit', :as => 'edit_project'
  get 'projects/:id(.:format)' => 'projects#show', :as => 'project', :constraints => { :id => %r([^/.?]+) }
  post 'projects(.:format)' => 'projects#create', :as => 'create_project'
  put 'projects/:id(.:format)' => 'projects#update', :as => 'update_project', :constraints => { :id => %r([^/.?]+) }
  delete 'projects/:id(.:format)' => 'projects#destroy', :as => 'destroy_project', :constraints => { :id => %r([^/.?]+) }


  # Resource routes for controller "requirements"
  get 'requirements/new(.:format)', :as => 'new_requirement'
  get 'requirements/:id/edit(.:format)' => 'requirements#edit', :as => 'edit_requirement'
  get 'requirements/:id(.:format)' => 'requirements#show', :as => 'requirement', :constraints => { :id => %r([^/.?]+) }
  post 'requirements(.:format)' => 'requirements#create', :as => 'create_requirement'
  put 'requirements/:id(.:format)' => 'requirements#update', :as => 'update_requirement', :constraints => { :id => %r([^/.?]+) }
  delete 'requirements/:id(.:format)' => 'requirements#destroy', :as => 'destroy_requirement', :constraints => { :id => %r([^/.?]+) }

  # Owner routes for controller "requirements"
  get 'projects/:project_id/requirements/new(.:format)' => 'requirements#new_for_project', :as => 'new_requirement_for_project'
  post 'projects/:project_id/requirements(.:format)' => 'requirements#create_for_project', :as => 'create_requirement_for_project'


  # Resource routes for controller "requirement_statuses"
  get 'requirement_statuses(.:format)' => 'requirement_statuses#index', :as => 'requirement_statuses'
  get 'requirement_statuses/new(.:format)', :as => 'new_requirement_status'
  post 'requirement_statuses(.:format)' => 'requirement_statuses#create', :as => 'create_requirement_status'
  put 'requirement_statuses/:id(.:format)' => 'requirement_statuses#update', :as => 'update_requirement_status', :constraints => { :id => %r([^/.?]+) }
  delete 'requirement_statuses/:id(.:format)' => 'requirement_statuses#destroy', :as => 'destroy_requirement_status', :constraints => { :id => %r([^/.?]+) }


  # Resource routes for controller "tasks"
  get 'tasks/:id/edit(.:format)' => 'tasks#edit', :as => 'edit_task'
  post 'tasks(.:format)' => 'tasks#create', :as => 'create_task'
  put 'tasks/:id(.:format)' => 'tasks#update', :as => 'update_task', :constraints => { :id => %r([^/.?]+) }
  delete 'tasks/:id(.:format)' => 'tasks#destroy', :as => 'destroy_task', :constraints => { :id => %r([^/.?]+) }

  # Owner routes for controller "tasks"
  post 'requirements/:requirement_id/tasks(.:format)' => 'tasks#create_for_requirement', :as => 'create_task_for_requirement'

  # Reorder routes for controller "tasks"
  post 'tasks/reorder(.:format)', :as => 'reorder_tasks'


  # Lifecycle routes for controller "users"
  post 'users/signup(.:format)' => 'users#do_signup', :as => 'do_user_signup'
  get 'users/signup(.:format)' => 'users#signup', :as => 'user_signup'
  put 'users/:id/reset_password(.:format)' => 'users#do_reset_password', :as => 'do_user_reset_password'
  get 'users/:id/reset_password(.:format)' => 'users#reset_password', :as => 'user_reset_password'

  # Resource routes for controller "users"
  get 'users(.:format)' => 'users#index', :as => 'users'
  get 'users/new(.:format)', :as => 'new_user'
  get 'users/:id/edit(.:format)' => 'users#edit', :as => 'edit_user'
  get 'users/:id(.:format)' => 'users#show', :as => 'user', :constraints => { :id => %r([^/.?]+) }
  post 'users(.:format)' => 'users#create', :as => 'create_user'
  put 'users/:id(.:format)' => 'users#update', :as => 'update_user', :constraints => { :id => %r([^/.?]+) }
  delete 'users/:id(.:format)' => 'users#destroy', :as => 'destroy_user', :constraints => { :id => %r([^/.?]+) }

  # Show action routes for controller "users"
  get 'users/:id/account(.:format)' => 'users#account', :as => 'user_account'

  # User routes for controller "users"
  match 'login(.:format)' => 'users#login', :as => 'user_login'
  get 'logout(.:format)' => 'users#logout', :as => 'user_logout'
  match 'forgot_password(.:format)' => 'users#forgot_password', :as => 'user_forgot_password'

end
