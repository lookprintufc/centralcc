Rails.application.routes.draw do
  
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users,
  controllers: {
    sessions: "users/sessions",
    passwords: "users/passwords",
    registrations: "users/registrations",
    confirmations: 'users/confirmations'
  },
    path: "/",
    path_names: { sign_in: 'login',
                  sign_out: 'logout',
                  password: 'secret',
                  unlock: 'unblock',
                  registration: 'inscription',
                  sign_up: 'new' }

  devise_scope :user do
    authenticated :user do
      root to: 'dashboard#index',  as: :authenticated_user_root
      resources :cards

    end
    unauthenticated :users do
      root to: "users/sessions#new", as: :unauthenticated_user_root

    end

  end


  post 'api/insert' => "api/api#index"

 
end
