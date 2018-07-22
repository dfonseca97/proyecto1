Rails.application.routes.draw do
  devise_for :users
  get 'event/get_location'
  get 'event/map'
  get 'event/store'
  get 'event/get_date'
  root :to =>'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
