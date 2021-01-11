# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/cart.rb'

class CartTest < Minitest::Test
  def setup
    super
    @cart = Cart.new
  end

  def test_black_cat_with_light_weight
    shipping_fee = calculate_shipping_fee(:black_cat, 30, 20, 10, 5)
    fee_should_be(150, shipping_fee)
  end

  def test_black_cat_with_heavy_weight
    shipping_fee = calculate_shipping_fee(:black_cat, 30, 20, 10, 50)
    fee_should_be(500, shipping_fee)
  end

  def test_hsinchu_with_small_size
    shipping_fee = calculate_shipping_fee(:hsinchu, 30, 20, 10, 50)
    fee_should_be(144, shipping_fee)
  end

  def test_hsinchu_with_huge_size
    shipping_fee = calculate_shipping_fee(:hsinchu, 100, 20, 10, 50)
    fee_should_be(480, shipping_fee)
  end

  def test_post_office_by_weight
    shipping_fee = calculate_shipping_fee(:post_office, 100, 20, 10, 3)
    fee_should_be(110, shipping_fee)
  end

  def test_post_office_by_size
    shipping_fee = calculate_shipping_fee(:post_office, 100, 20, 10, 300)
    fee_should_be(440, shipping_fee)
  end

  private

  def calculate_shipping_fee(shipper, length, width, height, weight)
    product = Product.new(length, width, height, weight)
    @cart.shipping_fee(shipper, product)
  end

  def fee_should_be(expected, shipping_fee)
    assert_equal expected, shipping_fee
  end
end
