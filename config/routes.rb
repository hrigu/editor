Rails.application.routes.draw do
  resources :people do
    resources :comments
    collection do
      get 'lawyers'
    end
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'
end
