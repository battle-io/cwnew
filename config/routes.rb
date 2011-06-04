Cwnew::Application.routes.draw do

  root :to => "home#index"
  match "/auth/:provider/callback" , :to => "sessions#create"
  match "/auth/failure" , to: "sessions#new"

end

