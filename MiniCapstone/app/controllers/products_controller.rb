class ProductsController < ApplicationController
  def welcome
    render 'welcome.html.erb'
  end

  def index
    @products = Product.all
    render 'index.html.erb'
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def new

    render 'new.html.erb'
  end

  def create

    render 'create.html.erb'
  end
end
