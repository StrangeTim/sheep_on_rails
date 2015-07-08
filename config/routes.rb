Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'users/registrations'}
  root 'pages#home'
  resources 'user', only: [:show] do
    resources 'images', except: [:index]
  end
end
