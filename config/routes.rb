Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :user, controllers: {
    passwords: 'devise/passwords',
    sessions: 'devise/sessions',
  }

  # as :user do 
  #   get 'login' => 'devise/sessions#new', as: :new_user_session
  #   post 'login' => 'devise/sessions#create', as: :user_session 
  #   delete 'logout' => 'devise/sessions#destroy', as: :destroy_user_session
  #   get 'register' => 'devise/registrations#new'
  # end 


end
