class ProductsController < ApplicationController

  def index
    @search = params['form_search']
    @products = Product.all
    
    @random_product = @products.shuffle.first.id
    if params[:order] == "price_high"
      @products = Product.all.order(price: :desc)
    elsif params[:order] == "price_low"
      @products = Product.all.order(price: :asc)
    elsif params[:order] == "name"
      @products = Product.all.order(:name)
    elsif params[:discount] == "true"
      @products = Product.where("price <= ?", 20)
    end
    
    if @search
      @products = Product.where("name LIKE ?", "%#{@search}%")
    end

    render 'index.html.erb'
  end

  def show
    @random_product = Product.all.shuffle.first.id
    @product = Product.find_by(id: params[:id])

    render 'show.html.erb'
  end

  def new
    @suppliers = Supplier.all
    render 'new.html.erb'
  end

  def create
    @product = Product.create(
      name: params['form_name'],
      # image was here
      price: params['form_price'],
      description: params['form_description'],
      supplier_id: params['supplier_id']
      )

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
