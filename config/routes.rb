Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :presenters

  root to: 'static_pages#home'

  match '/volunteer', to: 'presenters#new',     via: 'get'
  match '/about',     to: 'static_pages#about', via: 'get'
end
