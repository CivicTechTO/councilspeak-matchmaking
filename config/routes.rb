Rails.application.routes.draw do
  get 'wizard/index'

  root 'wizard#index'
end
