Rails.application.routes.draw do
  root 'pages#home'
  get  'pages/home'
  get 'about',to: 'pages#about'
  resources :articles ,only:[:show, :index, :create, :new, :edit, :update, :destroy]
  get 'signup', to: 'users#new'
  # post 'users', to: 'users#create'
  resources :users, except: [:new]
end
