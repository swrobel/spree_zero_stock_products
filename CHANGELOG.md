## 2.3.0

* Spree ~> 2.3.0 compatibility
* Drop jruby support as Spree doesn't seem to support it
* Drop rbx experimental support since Travis never seems to build using it

## 2.2.0

* Spree ~> 2.2.0 compatibility

## 2.1.0

* Spree ~> 2.1.0 compatibility

## 2.0.2

* Fix for Spree >= 2.0.5 because StockItems can now be deleted

## 2.0.1

* Backorderable products will now be shown even if `show_zero_stock_products = false`
* Using durable_decorator by @jumph4x to DRY-up method overrides & warn about changes to overridden code
* Tested against jruby, postgres & mysql

## 2.0.0

* Initial release
