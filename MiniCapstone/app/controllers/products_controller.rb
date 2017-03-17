class ProductsController < ApplicationController

  def index
    @search = params['form_search']
   
    @random_product = Product.all.shuffle.first.id
    if params[:sort_by] == "price_high"
      @products = Product.all.order(price: :desc)
    elsif params[:sort_by] == "price_low"
      @products = Product.all.order(price: :asc)
    elsif params[:sort_by] == "name"
      @products = Product.all.order(:name)
    elsif params[:discount] == "true"
      @products = Product.where("price <= ?", 20)
    else
      @products = Product.all
    end
    
    if @search
      @products = Product.where("name LIKE ?", "%#{@search}%")
      p @product
    end

    render 'index.html.erb'
  end

  def show
    @random_product = Product.all.shuffle.first.id
    @product = Product.find_by(id: params[:id])
    
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
  
  @product = Product.new(
    name: params['form_name'],
    image: params['form_image'],
    price: params['form_price'],
    description: params['form_description']
    )

  @product.save
  flash[:success] = "You have created a new product."
  redirect_to "/products/#{@product.id}"
  end

  def edit
    @product = Product.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params['form_name'],
      image: params['form_image'],
      price: params['form_price'].to_i,
      description: params['form_description']
    )

    flash[:warning] = "You edited #{@product.name}."
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:danger] = "You deleted #{@product.name}."
    redirect_to "/products"
  end
end
