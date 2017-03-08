Rails.application.routes.draw do
  resources :servants, only: [:index]
end
