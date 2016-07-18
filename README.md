# Checkout Tech Test

[![Build Status](https://travis-ci.org/harrim91/checkout_tech_test.svg?branch=master)](https://travis-ci.org/harrim91/checkout_tech_test)
[![Coverage Status](https://coveralls.io/repos/github/harrim91/checkout_tech_test/badge.svg?branch=master)](https://coveralls.io/github/harrim91/checkout_tech_test?branch=master)

## User Stories

```
As a customer  
I want to be able to add items to the basket  
So that I can keep track of the total price
```

```
As a member of the marketing team  
I want to be able to define promotional rules and add them to the checkout
So that customers have a greater incentive to buy things
```

```
As a customer
I want promotional rules to be applied to my basket by the checkout
So that I get charged the right price
```

## Installation

- `git clone git@github.com:harrim91/babylon_checkout_tech_test.git`
- `cd babylon_checkout_tech_test`
- `bundle install`
- To run tests: `rspec`

## Usage
```
[1] pry(main)> require './lib/product.rb'  
=> true

[2] pry(main)> require './lib/discount.rb'  
=> true

[3] pry(main)> require './lib/promotions/minimum_spend_promotion.rb'  
=> true

[4] pry(main)> require './lib/promotions/multibuy_promotion.rb'  
=> true

[5] pry(main)> require './lib/checkout.rb'  
=> true

[6] pry(main)> require './lib/basket.rb'  
=> true

[7] pry(main)> heart = Product.new '001', 'Lavender heart', 9.25  
=> #<Product:0x007fe381d849d0 @code="001", @name="Lavender heart", @price=9.25>

[8] pry(main)> cufflinks = Product.new '002', 'Personalised cufflinks', 45.00  
=> #<Product:0x007fe381d2f598 @code="002", @name="Personalised cufflinks", @price=45.0>

[9] pry(main)> tshirt = Product.new '003', 'Kids T-shirt', 19.95  
=> #<Product:0x007fe381cccdd0 @code="003", @name="Kids T-shirt", @price=19.95>

[10] pry(main)> ms = MinimumSpendPromotion.new 60, 10, 2  
=> #<MinimumSpendPromotion:0x007fe381e34678 @discount=10, @discount_klass=Discount, @minimum_spend=60, @priority=2>

[11] pry(main)> mb = MultibuyPromotion.new '001', 2, 0.75, 1  
=> #<MultibuyPromotion:0x007fe381dc6df8 @code="001", @discount=0.75, @discount_klass=Discount, @priority=1, @quantity=2>

[12] pry(main)> co = Checkout.new [ms, mb]  
=> #<Checkout:0x007fe381c75e40
 @basket=#<Basket:0x007fe381c75dc8 @basket=[]>,
 @promotions=
  [#<MultibuyPromotion:0x007fe381dc6df8 @code="001", @discount=0.75, @discount_klass=Discount, @priority=1, @quantity=2>,
   #<MinimumSpendPromotion:0x007fe381e34678 @discount=10, @discount_klass=Discount, @minimum_spend=60, @priority=2>]>

[13] pry(main)> co.scan heart  
=> [#<Product:0x007fe381d849d0 @code="001", @name="Lavender heart", @price=9.25>]

[14] pry(main)> co.scan tshirt  
=> [#<Product:0x007fe381d849d0 @code="001", @name="Lavender heart", @price=9.25>, #<Product:0x007fe381cccdd0 @code="003", @name="Kids T-shirt", @price=19.95>]

[15] pry(main)> co.scan heart  
=> [#<Product:0x007fe381d849d0 @code="001", @name="Lavender heart", @price=9.25>,
 #<Product:0x007fe381cccdd0 @code="003", @name="Kids T-shirt", @price=19.95>,
 #<Product:0x007fe381d849d0 @code="001", @name="Lavender heart", @price=9.25>]

[16] pry(main)> co.scan cufflinks  
=> [#<Product:0x007fe381d849d0 @code="001", @name="Lavender heart", @price=9.25>,
 #<Product:0x007fe381cccdd0 @code="003", @name="Kids T-shirt", @price=19.95>,
 #<Product:0x007fe381d849d0 @code="001", @name="Lavender heart", @price=9.25>,
 #<Product:0x007fe381d2f598 @code="002", @name="Personalised cufflinks", @price=45.0>]

[17] pry(main)> co.total  
=> 73.76
```