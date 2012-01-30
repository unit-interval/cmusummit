Cmusummit::Application.routes.draw do
  resources :guests

  resources :presentations

  resources :users

  root :to => 'index#index'

  get "agenda", "contest", "team", "info", "login", "logout", "people", :controller => "index"
  post "login" => 'index#sign_in'

end
