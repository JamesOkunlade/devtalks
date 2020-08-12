Rails.application.routes.draw do
  root 'discussions#index'

  resources :channels
  resources :discussions do
    resources :replies
  end

  devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
