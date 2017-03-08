class ProductsController < ApplicationController
  def welcome
    render 'welcome.html.erb'
  end

  def all_products
    @products = Product.all
    render 'all-products.html.erb'
  end
end
