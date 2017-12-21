Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'games#new'
  resources :games, only: [:new, :create, :update, :show]
  resources :games_questions, only: [:edit, :update]
end
