class OrdersController < ApplicationController

	def create
		
		@order = Order.create(
			user_id: current_user.id,
			product_id: params[:product_id],
			quantity: params[:quantity],
			subtotal: params[:subtotal],
			tax: params[:tax],
			total: params[:total]
		)
		
		redirect_to "/orders/show"
	end

	def show
		@order = Order.last
		render "show.html.erb"
	end
end
