Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  get 'users/:id' => 'users#show'
end
