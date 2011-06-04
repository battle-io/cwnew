Cwnew::Application.routes.draw do

  root :to => "home#index" , :as => :home

  ## Authentication
  #
    match "/auth/:provider/callback" , :to => "sessions#create"
    match "/auth/failure"            , :to => "sessions#new"

  ## Users
  #
    resources :users , :only => [ :show ]
    match "/profile" => "users#show"

end

