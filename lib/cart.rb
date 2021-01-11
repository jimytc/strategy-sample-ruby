# frozen_string_literal: true

require_relative 'product.rb'

class Cart
  def shipping_fee(shipper, product)
    if shipper == :black_cat
      if product.weight > 20
        500
      else
        100 + product.weight * 10
      end
    elsif shipper == :hsinchu
      size = product_size(product)
      if product.length > 100 or product.width > 100 or product.height > 100
        size * 0.00002 * 1100 + 500
      else
        size * 0.00002 * 1200
      end
    elsif shipper == :post_office
      fee_by_weight = 80 + product.weight * 10
      size = product_size(product)
      fee_by_size = size * 0.00002 * 1100
      [fee_by_weight, fee_by_size].min
    else
      raise ArgumentError, 'shipper does not exist'
    end
  end

  private

  def product_size(product)
    product.length * product.width * product.height
  end
end
