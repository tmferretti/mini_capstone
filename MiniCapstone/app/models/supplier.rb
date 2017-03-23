class Supplier < ApplicationRecord
  has_many :products
  def products
    # grab all the products that have this supplier
    Product.where(supplier_id: id)
  end

end
