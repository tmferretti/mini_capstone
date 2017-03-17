class Product < ApplicationRecord
  
  

  def tax
    return price.to_f * 0.09
  end

  def total_price
    return price.to_f + tax.to_f
  end

end
