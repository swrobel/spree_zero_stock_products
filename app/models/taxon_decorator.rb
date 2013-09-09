Spree::Taxon.class_eval do
  # Returns products in this taxon that are active (and in stock, depending on settings)
  def active_products
    scope = products.active
    scope = scope.on_hand unless Spree::Config[:show_zero_stock_products]
    scope
  end
end
