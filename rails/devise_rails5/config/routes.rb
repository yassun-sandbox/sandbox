Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  root 'pages#index'
  get 'pages/index'
  get 'pages/show'
  if Rails.env.development?
        mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
