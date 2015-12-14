Rails.application.routes.draw do
  root "pages#home"
  resources :votes, only: [:index, :new, :create]
end
