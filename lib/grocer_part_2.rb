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
  cart.each{|item|
    if item[:clearance]
      item[:price] = (item[:price] * 80 / 100).round(2)
    end
  }
  cart
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
  consolidate_cart = consolidate_cart(cart)
  applied_coupons = apply_coupons(consolidate_cart, coupons)
  final_cart = apply_clearance(applied_coupons)

  total = 0.00
  final_cart.each{ |item|
    total += (item[:price] * item[:count])
  }

  if(total >= 100.0)
    return (total * 90/100).round(2)
  end
  total
end

#
# items =
#   [
#     {:item => "AVOCADO", :price => 3.00, :clearance => true},
#     {:item => "KALE", :price => 3.00, :clearance => false},
#     {:item => "BLACK_BEANS", :price => 2.50, :clearance => false},
#     {:item => "ALMONDS", :price => 9.00, :clearance => false},
#     {:item => "TEMPEH", :price => 3.00, :clearance => true},
#     {:item => "CHEESE", :price => 6.50, :clearance => false},
#     {:item => "BEER", :price => 13.00, :clearance => false},
#     {:item => "PEANUTBUTTER", :price => 3.00, :clearance => true},
#     {:item => "BEETS", :price => 2.50, :clearance => false},
#     {:item => "SOY MILK", :price => 4.50, :clearance => true}
#   ]
#
# coupons =
#     [
#       {:item => "AVOCADO", :num => 2, :cost => 5.00},
#       {:item => "BEER", :num => 2, :cost => 20.00},
#       {:item => "CHEESE", :num => 3, :cost => 15.00}
#     ]
#
# beer = find_item_by_name_in_collection('BEER', items)
# beets = find_item_by_name_in_collection('BEETS', items)
# cart = [beets, beer, beer, beer]
# coupon_collection = [coupons[1]]
#
# puts checkout(cart, coupon_collection)
