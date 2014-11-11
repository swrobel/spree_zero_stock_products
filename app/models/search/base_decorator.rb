Spree::Core::Search::Base.class_eval do

protected
  durably_decorate :get_base_scope, mode: 'soft', sha: '666c885704fa5faab8fe1ca64a7032b2c7d0253a' do
    if Spree::Config[:show_zero_stock_products]
      original_get_base_scope
    else
      original_get_base_scope.on_hand
    end
  end
end
