Spree::Taxon.class_eval do
  # Returns products in this taxon that are active (and in stock, depending on settings)
  durably_decorate :active_products, mode: 'soft', sha: '3661de088762ab6a5b880446ca6296200b7521eb' do
    if Spree::Config[:show_zero_stock_products]
      original_active_products
    else
      original_active_products.on_hand
    end
  end
end
