Rails.application.routes.draw do

  # get 'meetings/index'
  #
  # get 'meetings/show'
  #
  # get 'meetings/new'
  #
  # get 'meetings/create'
  #
  # get 'meetings/edit'
  #
  # get 'meetings/update'
  #
  # get 'meetings/destroy'
  #
  # get 'meetings/about'
  #
  # get 'people/index'
  #
  # get 'people/show'
  #
  # get 'people/new'
  #
  # get 'people/create'
  #
  # get 'people/edit'
  #
  # get 'people/update'
  #
  # get 'people/destroy'
  #
  # get 'people/about'

  get "/about" => 'meetings#about'
  # get "/all" => 'events#all'
  get "/leaderboard" => 'people#leaderboard'
  get "/contact" => 'main#contact'
  get "/pending" => 'main#pending'

  # devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  # resources :users
  #resources :events
  # root to: 'main#general'

  resources :people do
    resources :meetings
  end
  resources :meetings
  root to: 'main#general'
  # get 'auth/:provider/callback', to: 'people#login'
  # get 'auth/failure', to: redirect('/')
  get 'signout', to: 'people#logout', as: 'signout'
  devise_for :people, controllers: { omniauth_callbacks: 'people' }
  #root to: 'meetings#index'

  # resources :events do
  #   resources :registrees
  # end
  # resources :occurrences do
  #   resources :attendees
  # end
  post '/meetings/:id/add_meeting', to: 'meetings#add_to_current_user', as: :add_meeting
end
