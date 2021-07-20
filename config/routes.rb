Rails.application.routes.draw do
  get 'appointments/index'
  devise_for :users
  root 'main#home'

  resources :appointments
  resources :types

  get '/user_appointment/:id' => 'appointments#show_by_user', as: :user_appointment
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
