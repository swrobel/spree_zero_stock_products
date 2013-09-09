Spree::Product.class_eval do
  # Returns only products that are in stock or backorderable
  add_search_scope :on_hand do
    where(
      <<-SQL
        #{table_name}.id IN
        (
          SELECT product_id FROM #{Spree::Variant.table_name} v
          JOIN #{Spree::StockItem.table_name} i
          ON v.id = i.variant_id
          WHERE deleted_at IS NULL
          GROUP BY product_id
          HAVING SUM(count_on_hand) > 0
            OR MAX(CASE backorderable
                    WHEN #{ActiveRecord::Base.connection.quoted_true} THEN 1
                    ELSE 0
                  END) > 0
        )
      SQL
    )
  end
end
