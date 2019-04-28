Rails.application.routes.draw do

  get 'admin' => 'admin#index'

  namespace :admin do
    resources :stores, :except => [:post, :delete]
    resources :leaks, :except => [:post, :delete]
    resources :contacts, :except => [:post, :delete]
  end

  # devise_for :users
  devise_for :users, skip: :all
  devise_scope :user do
    get 'login' => 'devise/sessions#new', as: :new_user_session
    post 'login' => 'devise/sessions#create', as: :user_session
    delete 'logout' => 'devise/sessions#destroy', as: :destroy_user_session
  end

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
