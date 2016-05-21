Rails.application.routes.draw do
  devise_for :users
  
  root 'home#main'
  # match ":controller(/:action(/:id))", via: [:get, :post]
  
  # get 'login' => 'home#login'                                                           # 로그인 전 화면 ( 뷰파일 )
  get 'main' => 'home#main'                                                             # 로그인 후 화면, 10개 보여주는 페이지 ( 뷰파일 )
  get "/mypost" => "home#mypost"                                                                          #내 글 보기
  post '/post/write' => 'home#post_write'                                                # 글 작성
  get '/post/:post_id/destroy' => 'home#post_destory'                                   # 글 삭제
  post '/post/:post_id/edit' => 'home#post_edit'                                         # 수정이 실제로 일어나는 페이지
  get '/post/:post_id/edit/view' => 'home#post_edit_view'        
  # get                                                                                     # 수정할 페이지
  
  post '/post/comment/write' => 'home#comment_write'                                # 글에서 댓글 작성
  get '/post/:post_id/comment/:comment_id/destroy' => 'home#comment_destroy'            # 글에서 댓글 삭제
  post '/post/:post_id/comment/:comment_id/edit' => 'home#comment_edit'                  # 글에서 댓글 수정
  
  get '/post/search/' => 'home#post_search'                                              # 글 검색
  get '/post/search/mypost' => 'home#post_search_mypost'                                                # 태그 검색


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
