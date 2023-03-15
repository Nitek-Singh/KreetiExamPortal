Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #get 'exams/new', to: 'exams#new', as: 'new_quiz' 
  root "dashboards#index"

  resources :users

  resources :dashboards do
    member do
      get 'schedule'
    end
  end

  get 'exams/details', to: 'exams#details', as: 'exam_details'

  resources :exams do
    member do
      get 'demo_attempt'
      post 'demo_calculate_score'
    end
    resources :questions
  end

  resources :registrations do
    member do
      get 'attempt'
      patch 'calculate_score'
    end
  end

  get '/login', to: 'sessions#login'
  get '/participations', to: 'participations#index'
  get 'leaderboards', to: 'leaderboards#index'

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


end
