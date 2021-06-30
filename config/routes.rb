Rails.application.routes.draw do
    resources :accounts do
    resources :records
  end
end
