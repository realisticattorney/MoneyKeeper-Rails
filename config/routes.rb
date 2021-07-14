Rails.application.routes.draw do
    resources :accounts, only: [:index, :show, :create, :destroy] do
    resources :records
  end
    post 'auth/login', to: 'authentication#authenticate'
    post 'signup', to: 'users#create'
end
