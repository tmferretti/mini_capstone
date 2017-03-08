Rails.application.routes.draw do
  get '/all-products' => 'products#all_products'
  get '/welcome' => 'products#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
