Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :presenters

  get 'wizard/index'

  root 'wizard#index'
end
