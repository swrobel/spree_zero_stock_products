Spree::Product.class_eval do
  add_search_scope :on_hand do
    where("#{table_name}.id IN (SELECT product_id FROM #{Spree::Variant.table_name} v JOIN #{Spree::StockItem.table_name} i ON v.id = i.variant_id WHERE deleted_at IS NULL GROUP BY product_id HAVING SUM(count_on_hand) > 0)")
  end
end
