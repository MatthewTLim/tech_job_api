Rails.application.routes.draw do
  resources :jobs, only: [:index, :show]
end
