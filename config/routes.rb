Rails.application.routes.draw do
  root :to => "spaces#index"
  # Routes for the Review resource:
  # CREATE
  get "/reviews/new", :controller => "reviews", :action => "new"
  post "/create_review", :controller => "reviews", :action => "create"

  # READ
  get "/reviews", :controller => "reviews", :action => "index"
  get "/reviews/:id", :controller => "reviews", :action => "show"

  # UPDATE
  get "/reviews/:id/edit", :controller => "reviews", :action => "edit"
  post "/update_review/:id", :controller => "reviews", :action => "update"

  # DELETE
  get "/delete_review/:id", :controller => "reviews", :action => "destroy"
  #------------------------------

  # Routes for the Space resource:
  # CREATE
  get "/spaces/new", :controller => "spaces", :action => "new"
  post "/create_space", :controller => "spaces", :action => "create"

  # READ
  get "/spaces", :controller => "spaces", :action => "index"
  get "/spaces/:id", :controller => "spaces", :action => "show"

  # UPDATE
  get "/spaces/:id/edit", :controller => "spaces", :action => "edit"
  post "/update_space/:id", :controller => "spaces", :action => "update"

  # DELETE
  get "/delete_space/:id", :controller => "spaces", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
