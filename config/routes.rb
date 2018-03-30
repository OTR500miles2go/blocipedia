Rails.application.routes.draw do
  resources :wikis
  resources :charges, only: [:new, :create]
  
  devise_for :users

  get 'users/downgrade' => 'users#downgrade', as: :downgrade 

  get 'about' => 'welcome#about'
  
  root 'welcome#index'
  
end
