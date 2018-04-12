Rails.application.routes.draw do

  get 'meeting/index'

  get 'meeting/show'

  get 'meeting/new'

  get 'meeting/create'

  get 'meeting/edit'

  get 'meeting/update'

  get 'meeting/destroy'

  get 'meeting/about'

  get 'person/index'

  get 'person/show'

  get 'person/new'

  get 'person/create'

  get 'person/edit'

  get 'person/update'

  get 'person/destroy'

  get 'person/about'

  # get "/about" => 'events#about'
  # get "/all" => 'events#all'
  # get "/leaderboard" => 'users#leaderboard'
  # get "/contact" => 'users#contact'

  # devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  # resources :users
  # resources :events
  # root to: 'main#general'

  resources :people
  resources :meetings
  root to: 'main#general'

  # resources :events do
  #   resources :registrees
  # end
  # resources :occurrences do
  #   resources :attendees
  # end

end
