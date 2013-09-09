require 'spec_helper'

describe Spree::Core::Search::Base do

  before do
    stock_location = create(:stock_location, backorderable_default: false)
    @product_with_stock = create(:product)
    @product_out_of_stock = create(:product)

    stock_location.stock_items.where(:variant_id => @product_with_stock.master.id).first.adjust_count_on_hand(10)
    stock_location.stock_items.where(:variant_id => @product_out_of_stock.master.id).first.adjust_count_on_hand(0)
  end

  context "with show_zero_stock_products = FALSE" do

    before do
      Spree::Config[:show_zero_stock_products] = false
    end

    it "returns only in stock products" do
      params = { :per_page => "" }
      searcher = Spree::Core::Search::Base.new(params)
      searcher.retrieve_products.should include @product_with_stock
      searcher.retrieve_products.should_not include @product_out_of_stock
    end
  end

  context "with show_zero_stock_products = TRUE" do

    before do
      Spree::Config[:show_zero_stock_products] = true
    end

    it "returns all products regardless of stock status" do
      params = { :per_page => "" }
      searcher = Spree::Core::Search::Base.new(params)
      searcher.retrieve_products.should include @product_with_stock
      searcher.retrieve_products.should include @product_out_of_stock
    end
  end
end
