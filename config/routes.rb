Rails.application.routes.draw do
  
 
  devise_for :staff ,controllers: {
    sessions: 'staffs/sessions',
    #registrations: 'staffs/registrations',
    passwords: 'staffs/passwords'
  } # path: '/', path_names: { sign_up: 'register_staff' }

  devise_for :student ,controllers: {
    sessions: 'students/sessions',
    #registrations: 'staffs/registrations',
    passwords: 'students/passwords'
  } # path: '/', path_names: { sign_up: 'register_staff' }

  root to: "home#index"
  # routes related to classes and corresponding subjects
  resources :forms
  resources :form do
    resources :subjects, only: [:index, :new,:create, :show, :destroy], controller: "form_subjects"
  end
  #--- end ---#
  resources :subjects
  resources :terms
  resources :academic_years

  resources :staff_subjects, only: [:create, :destroy], controller: "staffs/staff_subjects"
  resources :student_subjects, only: [:create, :destroy], controller: "students/student_subjects"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # devise_for :staffs ,controllers: { registrations: 'staffs/registrations' }
  #get '/staffs', to: 'staffs/registrations#index' ,as: "staffs"
  resources :staffs ,controller:"staffs/registrations"
  resources :students ,controller:"students/registrations"
  # Defines the root path route ("/")
  # root "posts#index"
  resources :assessments, controller: "staffs/assessments"


end
