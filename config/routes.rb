Rails.application.routes.draw do

  resources :wikis

  resources :wikis do
    resources :collaborators, only: [:new, :create, :destroy]
  end
  
  resources :users, only: [:update] do
    post '/update' => 'users#update', as: :publishing
  end 

  resources :charges, only: [:new, :create]

  devise_for :users
  
  get 'about' => 'welcome#about'

  get 'downgrade' => 'welcome#downgrade'

  root 'welcome#index'

end