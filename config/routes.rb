Rails.application.routes.draw do
  root 'home#index'
  get 'search/*path', controller: 'home', action: 'search'
end
