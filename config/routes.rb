Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "/api/v1", to ""
  # root ""
  # root :controller => "static", :action => "/"
  
  # TODO:DONE [TESTING] model with no versioning(using namespace) - to check integrity with form_with model featuer in '*.erb'
  # resources :users  # <- Successfully Tested

  namespace :api do
    namespace :v1 do
      # [NOTE]Due to the given POSTMAN specification, using Resourceful Routing feature is discarded, to follow the spec first.
      root "contents#index" # <Additional>

      # # User management
      # # 여러모로 상당히 불편하고 해서, 회원가입 관련 기능 및 템플릿도 추가하기로 했다.
      # # 게시물 관련 auth 문제로 자잘하게 고통받느니(일단 사용자 정보가 게시물에 FK로 not null하게 물려있는게 크다. nullable하게 만들고 나중에 바꿔도 되겠지만 또 유저 삭제시 cascade 하는 그런것도 고려해야하고.)
      # # 그냥 유저가 무조건 있다고 가정하고자 한다.
      # get "/users/signin", to: "users#auth"
      # get "/auth/signin", to: "users#new_session"
      get "/auth/signin", to: "users#auth", as: "sign_in"
      get "/users/signup", to: "users#new", defaults: { country: '' }  # optional field인 'country'의 default 설정을 여기서 해봄
      # &&&
      post "/auth/signin", to: "users#sign_in"
      post "/auth/signin", to: "users#create_session"
      post "/users/signup", to: "users#sign_up"
      # # update "/users/profile", to: ""  # TODO 
      # delete "/auth/wipeout", to: "users#wipe_out" # <Additional> TODO
      #
      # -> TODO:DONE Using 'resourceful routing'
      # sresources :users  # <- Successfully tested


      # Content CRUD
      # [주의] 여기 post랑 get에 매칭돼야할 경로가 바뀐거 같은데요!
      # POSTMAN에 있는 collection 한번 봐주세요!
      # -> 그런 문제가 아닌거 같아 친구.
      get "/contents", to: "contents#index" # <Additional>
      get "/contents/new", to: "contents#new" # <Additional>
      post "/contents", to: "contents#create"
      post "/contents/new", to: "contents#create"  # might be <Additional>
      get "/content", to: "contents#show"  # checkout POSTMAN spec
      get "/contents/:id", to: "contents#show"
      get "/contents/:id/update", to: "contents#edit"
      put "/contents/:id", to: "contents#update"
      delete "/contents/:id", to: "contents#destroy"
      # project_id로 게시물 id나 게시판 번호 같은걸 할당하려는건가? (See e.g. in POSTMAN collection)
      # ... 게다가 게시자 정보가? -> 어차피 spefication 보니까 Authorization 탭에 
      # bearer token이 있던데, project_id는 뭘 말하고 싶었던거지?
      # 당장은 해당 파라미터의 용도를 알 수 없으므로 무시하겠음.
      post "/projects/:project_id/contents", to: "contents#create"
      get "/projects/:project_id/contents", to: "contents#get"
      
      # Responses
      # Sign-Up
      #   Validation Error: 

      # 2023-02-23 18:04:23
      # POSTMAN에서 제공된 collection을 들여다 봤는데,
      # content와 관련해서, post랑 get만 /projects/:project_id/content
      # 의 형태로 'project_id'라는 경로 매개변수를 가진다. 
      # 원래는 지우려던게 제대로 처리가 안된건가?
    end
  end
end
