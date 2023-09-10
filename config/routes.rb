Rails.application.routes.draw do
  root 'lists#index'

  resources :lists, only: %i[index new edit create update]
end
