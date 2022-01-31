Rails.application.routes.draw do
  root 'pages#home'
  get  'pages/home'
  get 'about',to: 'pages#about'
  resources :articles ,only:[:show, :index, :create, :new, :edit, :update, :destroy]
end
