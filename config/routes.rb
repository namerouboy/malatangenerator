Rails.application.routes.draw do
  root "malatan#index"

  get "search" => "malatan#search"

end
