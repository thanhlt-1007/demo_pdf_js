Rails.application.routes.draw do
  root "lessons#index"

  resources :lessons, only: %i(new create show edit update)
end
