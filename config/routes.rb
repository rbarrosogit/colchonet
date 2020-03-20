Rails.application.routes.draw do
  LOCALES = /en|pt\-BR/
  scope "(:locale)", locale: LOCALES do
    resources :rooms do
      resources :reviews, only: [:create, :update], module: :rooms
    end
    resources :users
  end
  resource :confirmation, only: [:show]
  resource :user_sessions, only: [:create, :new, :destroy]
  get '/:locale' => 'home#index', locale: LOCALES
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
