Rails.application.routes.draw do
  get 'materials/index'

  get 'materials/new'

  get 'materials/create'

  get 'materials/destroy'

  # Mapeamento das rotas relacionadas ao devise
  devise_for :users, skip: :registrations, controllers: {
      passwords: 'users/passwords',
      confirmations: 'users/confirmations',
      sessions: 'users/sessions',
      unlocks: 'users/unlocks'
  }

  # Para remover a rota :destroy
  devise_scope :user do
    resource :registration,
             only: [:new, :create, :edit, :update],
             path: 'users',
             #path_names: {new: 'sign_up'},
             controller: 'users/registrations',
             as: :user_registration do
      get :cancel
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index', as: 'home'
  
  get 'about' => 'welcome#about', as: 'about'
  get '404' => 'welcome#not_found', as: 'not_found'
  
  # Example of regular route:
  get 'articles' => 'articles#index', as: 'articles'
  get 'articles/:id' => 'articles#show', as: 'article'

  get 'events/:id' => 'events#show', as: 'event'
  get 'events' => 'events#index', as: 'events'

  get 'teachers/:id' => 'teacher#show', as: 'teacher'
  get 'teachers' => 'teacher#index', as: 'teachers'
  
  get 'oportunities/:id' => 'oportunities#show', as: 'oportunity'
  get 'oportunities' => 'oportunities#index', as: 'oportunities'  
  get 'disciplines' => 'discipline#index', as: 'disciplines'
  
  namespace :dashboard do
    root 'articles#index', as: 'root'
    resources :articles, except: [:show]
    resources :events, except: [:show]
    resources :disciplines, except: [:show]
    resources :oportunities, except: [:show]
    resources :users, except: [:show]
    resources :discipline_classes, except: [:show]
    resources :materials, except: [:show]


    get 'profile' => 'profile#index', as: 'profile'
    post 'profile' => 'profile#update', as: 'profile_update'
  end

  scope 'portalC3' do
    namespace :api do
      get 'posts' => 'article#index'
      get 'posts/:id' => 'article#show'

      get 'eventos' => 'event#index'
      get 'eventos/:id' => 'event#show'

      get 'disciplinas' => 'discipline#index'

      get 'oportunidades' => 'oportunity#index'
      get 'oportunidades/:id' => 'oportunity#show'

      get 'professores' => 'teacher#index'
      get 'professores/:id' => 'teacher#show'
    end
  end

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
