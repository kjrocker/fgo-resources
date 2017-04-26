Rails.application.routes.draw do
  get 'servants/random', as: :random_servant
  resources :servants, only: [:index, :show]
end
