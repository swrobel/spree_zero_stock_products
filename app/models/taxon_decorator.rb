Spree::Taxon.class_eval do
  def active_products
    scope = products.active
    scope = scope.on_hand unless Spree::Config[:show_zero_stock_products]
    scope
  end
end
