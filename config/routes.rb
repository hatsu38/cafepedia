Rails.application.routes.draw do
  get 'stores/index'
  root to: 'stores#index'

  namespace :api,{format: 'json'} do
    resources :stores,only: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
