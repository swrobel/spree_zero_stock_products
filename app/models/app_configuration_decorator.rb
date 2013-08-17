Spree::AppConfiguration.class_eval do
  preference :show_zero_stock_products, :boolean, :default => true
end
