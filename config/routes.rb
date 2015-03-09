Rails.application.routes.draw do

  resources :users do
    resources :tasks
  end

end
