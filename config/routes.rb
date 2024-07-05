Rails.application.routes.draw do
  root 'welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # viewparty routes ##############################################
  get '/viewparty', to: 'viewparty/landing#index'
  get '/viewparty/register', to: 'viewparty/viewers#new', as: 'register'
  post '/viewparty/register', to: 'viewparty/viewers#create'

  get 'viewparty/login', to: 'viewparty/sessions#new'
  post 'viewparty/login', to: 'viewparty/sessions#create'
  delete 'viewparty/logout', to: 'viewparty/sessions#destroy'

  namespace :viewparty do
    resources :viewers, only: [:index, :create, :new, :show] do
      resources :viewer_parties, only: :index, path: 'discover', as: 'discover'
      resources :dashboard, only: :show, path: 'dashboard', as: 'dashboard'
      
      resources :movies, only: :index, as: 'results'
      resources :movies, only: :show do
        resources :viewer_parties, only: [:new, :create], path: 'viewing_party', as: 'viewing_party'
      end
    end
  end


  # all adopt routes ##############################################
  namespace :adopt do
    resources :applications, except: :destroy
    resources :shelters
    resources :pets, except: :new
    resources :veterinarians, except: :new
    resources :veterinary_offices

    namespace :admin do
      resources :applications
      resources :shelters
    end
  end


  get "/adopt/shelters/:shelter_id/pets", to: "adopt/shelters#pets"
  get "/adopt/shelters/:shelter_id/pets/new", to: "adopt/pets#new"
  post "/adopt/shelters/:shelter_id/pets", to: "adopt/pets#create"

  get "/adopt/veterinary_offices/:veterinary_office_id/veterinarians", to: "adopt/veterinary_offices#veterinarians"
  get "/adopt/veterinary_offices/:veterinary_office_id/veterinarians/new", to: "adopt/veterinarians#new"
  post "/adopt/veterinary_offices/:veterinary_office_id/veterinarians", to: "adopt/veterinarians#create"
  get "/adopt/admin/applications/:application_id", to: "adopt/admin/applications#show"
  get "/adopt/admin/shelters", to: "adopt/admin/shelters#index"
  patch "/adopt/application_pets/:pet_id", to: "adopt/application_pets#update"
  get "/adopt/admin/shelters/:id", to: "adopt/admin/shelters#show"


  # main pages ####################################################
  get "/education", to: "educations#index"
  get "/experience", to: "experiences#index"
  get "/portfolio", to: "projects#index"
  get "/adopt", to: "projects#adopt"
  # Defines the root path route ("/")
  # root "posts#index"
end
