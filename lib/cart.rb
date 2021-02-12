# frozen_string_literal: true

require_relative 'product.rb'

class Cart
  def initialize
    super
    @shipper_methods = {
      black_cat: method(:fee_by_black_cat),
      hsinchu: method(:fee_by_hsinchu),
      post_office: method(:fee_by_post_office),
    }
  end

  def shipping_fee(shipper, product)
    if @shipper_methods.key?(shipper)
      @shipper_methods[shipper][product]
    else
      raise ArgumentError, 'shipper does not exist'
    end
  end

  private

  def fee_by_post_office(product)
    fee_by_weight = 80 + product.weight * 10
    fee_by_size = product.size * 0.00002 * 1100
    [fee_by_weight, fee_by_size].min
  end

  def fee_by_hsinchu(product)
    if product.length > 100 or product.width > 100 or product.height > 100
      product.size * 0.00002 * 1100 + 500
    else
      product.size * 0.00002 * 1200
    end
  end

  def fee_by_black_cat(product)
    if product.weight > 20
      500
    else
      100 + product.weight * 10
    end
  end
end
