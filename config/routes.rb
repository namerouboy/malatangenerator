Rails.application.routes.draw do
  get 'malatan_results/index'
  get 'malatan_results/show'
  get 'malatan_results/create'
  root "malatan#index"

  get '/search', to: 'malatan#search'

  resources :malatan_results, only: [:create, :index, :show]

end
