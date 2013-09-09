Spree::Taxon.class_eval do
  # Returns products in this taxon that are active (and in stock, depending on settings)
  durably_decorate :active_products, mode: 'soft', sha: 'd2da9b539628597db39f535ea8aa2da241d61881' do
    if Spree::Config[:show_zero_stock_products]
      active_products_original
    else
      active_products_original.on_hand
    end
  end
end
