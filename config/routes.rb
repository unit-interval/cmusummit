Cmusummit::Application.routes.draw do
  resources :speakers

  resources :users

  resources :keynotes

  root :to => 'index#index'

  get "agenda", "contest", "faq", "info", "login", "logout", "sessions", :controller => "index"
  post "login" => 'index#sign_in'

end
