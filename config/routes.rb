Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # module the controllers without affecting the URI
  scope module: :v2, constraints: ApiVersion.new('v2', false) do
    resources :todos, only: :index
  end
  
  # namespace the controllers without affecting the URI
  scope module: :v1, constraint: ApiVersion.new('v1', true) do
    resources :todos do
      resources :items
    end  
  end
  
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
