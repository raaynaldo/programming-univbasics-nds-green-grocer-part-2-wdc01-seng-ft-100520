require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  coupons.each{ |coupon|
    findItem = find_item_by_name_in_collection(coupon[:item], cart)
    if findItem && findItem[:count]>coupon[:num]

      divideCoupon = find[:count]/coupon[:num]
      findItem[:count] = findItem[:count] - divideCoupon * coupon[:num]

      cart.push({
        :item => "#{find[:item]} W/COUPON",
        :price => coupon[:cost]/coupon[:num]
        })
    end
  }
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


puts 5/3
puts 5.00/2
