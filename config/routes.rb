Cwnew::Application.routes.draw do

  ## Authentication
  #
    match "/auth/:provider/callback" , :to => "sessions#create"
    match "/auth/failure"            , :to => "sessions#new"
    match "/login" => redirect("/auth/github")

  ## Bots
  #
    resources :bots , :only => [ :create , :new , :show ]

  ## Home
  #
    root :to => "home#index" , :as => :home
    match "/edu", :to => "home#edu", :as => :edu

  ## Users
  #
    resources :users , :only => [ :show ]
    match "/profile" => "users#show"

end

