Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root "contents#index"

      # Session/User management
      resources :users, only: [:new, :create]

      # [G2Step7]<Override>~
      post "/auth/signin", to: "sessions#create"  # , as: "login"
      post "/users/signup", to: "users#sign_up"

      # [G2Step20]<Override>~
      # delete "/logout", to: "sessions#destroy", as: "logout"
      resources :sessions
      resources :active_sessions, only: [:destroy] do
        collection do
          delete "destroy_all"
        end
      end
      # ~[G2Step20]<Override>

      # get "/auth/signin", to: "users#auth", as: "sign_in"
      get "/users/signup", to: "users#new", as: "sign_up_page", defaults: { country: '' }  # optional field인 'country'의 default 설정을 여기서 해봄
      get "/auth/signin", to: "sessions#new", as: "login_page"
      # ~[G2Step7]<Override>

      # Content CRUD
      resources :contents

      # Original API Specs
      # get "/contents", to: "contents#index" # <Additional>
      # get "/contents/new", to: "contents#new" # <Additional>
      # post "/contents", to: "contents#create"
      # post "/contents/new", to: "contents#create"  # might be <Additional>
      # get "/content", to: "contents#show"  # checkout POSTMAN spec
      # get "/contents/:id", to: "contents#show"
      # get "/contents/:id/update", to: "contents#edit"
      # put "/contents/:id", to: "contents#update"
      # delete "/contents/:id", to: "contents#destroy"
      #
      # post "/projects/:project_id/contents", to: "contents#create"
      # get "/projects/:project_id/contents", to: "contents#get"
    end
  end
  # match 'v:api/*path', :to => redirect("/api/v1/%{path}")
  # match '*path', :to => redirect("/api/v1/%{path}")
end
