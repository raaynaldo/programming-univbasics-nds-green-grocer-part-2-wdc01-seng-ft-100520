require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  coupons.each{ |coupon|
    findItem = find_item_by_name_in_collection(coupon[:item], cart)
    if findItem && findItem[:count]>=coupon[:num]
      divideCoupon = findItem[:count]/coupon[:num]
      findItem[:count] = findItem[:count] - divideCoupon * coupon[:num]
      cart.push({
        :item => "#{findItem[:item]} W/COUPON",
        :price => coupon[:cost]/coupon[:num],
        :clearance => findItem[:clearance],
        :count => divideCoupon * coupon[:num]
        })
    end
  }
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end


cart = [
  {:item => "AVOCADO", :price => 3.00, :clearance => true, :count => 3},
  {:item => "KALE",    :price => 3.00, :clearance => false, :count => 1}
]

coupon = [
  {:item => "AVOCADO", :num => 2, :cost => 5.00}
]

apply_coupons(cart, coupon)
