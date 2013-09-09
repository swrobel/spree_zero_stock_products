Spree::Core::Search::Base.class_eval do

protected
  durably_decorate :get_base_scope, mode: 'soft', sha: '0030f517d06459bfcde9ae18157806c3b702a71f' do
    if Spree::Config[:show_zero_stock_products]
      get_base_scope_original
    else
      get_base_scope_original.on_hand
    end
  end
end
