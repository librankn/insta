Rails.application.routes.draw do

  resources :igcls do
    collection do
      post :confirm
    end
  end

  resources :users do
    collection do
      post :favorite
    end
  end

  resources :favorites do
    collection do
      post :favorite
    end
  end

  resources :users, only: [:new,:create,:show]
  resources :sessions, only: [:new,:create,:destroy]
  resources :favorites, only: [:create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
