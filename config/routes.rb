Rails.application.routes.draw do
  root "malatan#index"

  get '/search', to: 'malatan#search'

end
