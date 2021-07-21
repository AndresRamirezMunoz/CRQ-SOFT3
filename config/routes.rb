Rails.application.routes.draw do
  get 'appointments/index'
  devise_for :users
  root 'main#home'

  resources :appointments
  resources :types
  resources :recuperators
  resources :buyers

  get '/user_appointment/:id' => 'appointments#show_by_user', as: :user_appointment
  patch '/appointments/:id/update-athome' => 'appointments#update_athome', as: :admin_update_athome
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
