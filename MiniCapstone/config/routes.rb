Rails.application.routes.draw do
  get '/products/:id' => 'products#show'
  get '/products' => 'products#index'
  get '/' => 'products#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
