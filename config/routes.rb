Rails.application.routes.draw do

  get "/about" => 'meetings#about'
  get "/leaderboard" => 'people#leaderboard'
  get "/contact" => 'main#contact'
  get "/pending" => 'main#pending'

  resources :people
  resources :meetings
  root to: 'main#general'

  get 'signout', to: 'people#logout', as: 'signout'
  devise_for :people, controllers: { omniauth_callbacks: 'people' }

end
