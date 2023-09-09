Rails.application.routes.draw do
  root 'lists#index'

  resources :lists, only: %i[index new create]
end
