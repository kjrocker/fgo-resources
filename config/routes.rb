Rails.application.routes.draw do
  root to: "servants#index"
  resources :servants, only: [:index, :show, :edit, :update]
end
