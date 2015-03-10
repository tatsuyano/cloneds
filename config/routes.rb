Rails.application.routes.draw do
  root 'users#show'
  get '/users/:rand_code' => 'users#show'

  resources :users do
    resources :tasks do
      resources :scores
    end
  end
end
