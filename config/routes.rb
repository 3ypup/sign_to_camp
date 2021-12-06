Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


get '/' => "posts#index"

get "/forms/refreshed/" => "forms#refreshed"
get "/forms/accept" =>"forms#accept"
get "/forms/archive" =>"forms#archive"

get "/forms/passports" =>"forms#passports"

get "/forms/myforms" =>"forms#myforms"

resources :users do
  resources :forms
  resources :posts

end


get "*path", to: redirect('/')
end
