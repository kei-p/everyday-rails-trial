Rails.application.routes.draw do
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions

  resources :contacts
  patch 'contacts/:id/hidden', to: 'contacts#hide_contact'

  resources :contacts do
    resources :phones
  end

  root 'contacts#index'
end
