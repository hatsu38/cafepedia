Rails.application.routes.draw do
  get 'stores/index'
  post 'stores/contact'
  post 'stores/leak'
  get '/stores/:id',to: 'stores#index'
  root to: 'stores#index'

  namespace :api,{format: 'json'} do
    resources :stores,only: [:index,:show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
