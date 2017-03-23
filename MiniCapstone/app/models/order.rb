class Order < ApplicationRecord
	belongs_to :user
	belongs_to :product
	def grand_total
		return quantity * total
	end

	def friendly_order_created_time
    	return created_at.strftime("%A, %b %d")
	end
end
