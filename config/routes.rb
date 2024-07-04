Rails.application.routes.draw do
  resources :project_skills
  resources :skills
  resources :education_points
  resources :experience_points
  resources :project_points
  resources :projects
  resources :experiences
  resources :educations
  root 'welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "/education", to: "educations#index"
  get "/experience", to: "experiences#index"
  get "/portfolio", to: "projects#index"

  # Defines the root path route ("/")
  # root "posts#index"
end
