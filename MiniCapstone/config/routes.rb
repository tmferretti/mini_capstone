Rails.application.routes.draw do
  get '/' => 'products#welcome'
  get '/products' => 'products#index'
  post '/products' => 'products#create'
  get '/products/new' => 'products#new'
  get '/products/:id' => 'products#show'
end
