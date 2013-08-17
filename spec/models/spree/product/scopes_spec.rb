require 'spec_helper'

describe "Product scopes" do

  context "with scope on_hand" do
    before do
      stock_location = create(:stock_location)
      @product_with_stock = create(:product)
      @product_out_of_stock = create(:product)

      stock_location.stock_items.where(:variant_id => @product_with_stock.master.id).first.adjust_count_on_hand(10)
      stock_location.stock_items.where(:variant_id => @product_out_of_stock.master.id).first.adjust_count_on_hand(0)
    end

    it "includes a product with available stock" do
      Spree::Product.on_hand.should include @product_with_stock
    end

    it "excludes a product without available stock" do
      Spree::Product.on_hand.should_not include @product_out_of_stock
    end
  end
end
