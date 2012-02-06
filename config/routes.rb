Cmusummit::Application.routes.draw do
  resources :guests do
    member do
      get :follow, :unfollow
    end
  end

  resources :presentations do
    member do
      get :follow, :unfollow
    end
  end

  resources :users

  root :to => 'index#index'

  get "agenda", "contest", "team", "info", "todo", "login", "logout", "people", :controller => "index"
  post "login" => 'index#sign_in'

end
