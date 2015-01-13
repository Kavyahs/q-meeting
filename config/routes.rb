Rails.application.routes.draw do

  namespace :user do
    resources :bookings
  end
  ## ----------
  ## APIs
  ## ----------

  # To be written.

  # ------------
  # Public pages
  # ------------

  root :to => 'public/user_sessions#sign_in'

  # Sign In URLs for users
  get     '/sign_in',         to: "public/user_sessions#sign_in",         as:  :user_sign_in
  get    '/create_session',   to: "public/user_sessions#create_session",  as:  :create_user_session

  # Logout Url
  delete  '/sign_out' ,       to: "public/user_sessions#sign_out",        as:  :user_sign_out

  # ------------
  # User pages
  # ------------

  namespace :user do
    get   '/dashboard',         to: "dashboard#index",   as:  :dashboard # Landing page after sign in
  end
end
