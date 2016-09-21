Rails.application.routes.draw do
  resources :presenters

  get 'wizard/index'

  root 'wizard#index'
end
