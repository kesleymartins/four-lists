Rails.application.routes.draw do
  root "lists#index"

  resources :lists, only: [:index, :new, :create]
end
