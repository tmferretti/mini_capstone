Rails.application.routes.draw do
  get '/products' => 'products#index'
  post '/products' => 'products#create'
  get '/products/new' => 'products#new'
  get '/products/:id' => 'products#show'
  get '/products/:id/edit' => 'products#edit'
  patch '/products/:id' => 'products#update'
  delete '/products/:id' => 'products#destroy'
end
