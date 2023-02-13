Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #get 'exams/new', to: 'exams#new', as: 'new_quiz' 
  root "pages#home"

  resources :users

  resources :dashboards

  resources :exams do
    resources :questions
  end

  resources :registrations do
    member do
      get 'attempt'
      patch 'calculate_score'
    end
  end

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


end
