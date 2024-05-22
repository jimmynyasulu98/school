Rails.application.routes.draw do
  resources :forms
  resources :terms
  resources :academic_years
  resources :subjects
  resources :staff_subjects

 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :students 
  devise_for :staffs
  # Defines the root path route ("/")
  # root "posts#index"
end