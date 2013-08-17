require 'spec_helper'

describe Spree::Core::Search::Base do

  before do
    stock_location = create(:stock_location)
    @product_with_stock = create(:product)
    @product_out_of_stock = create(:product)

    stock_location.stock_items.where(:variant_id => @product_with_stock.master.id).first.adjust_count_on_hand(10)
    stock_location.stock_items.where(:variant_id => @product_out_of_stock.master.id).first.adjust_count_on_hand(0)
  end

  context "with show_zero_stock_products = FALSE" do

    before do
      Spree::Config[:show_zero_stock_products] = false
    end

    it "returns all products by default" do
      params = { :per_page => "" }
      searcher = Spree::Core::Search::Base.new(params)
      searcher.retrieve_products.count.should == 1
    end
  end

  context "with show_zero_stock_products = TRUE" do

    before do
      Spree::Config[:show_zero_stock_products] = true
    end

    it "returns all products by default" do
      params = { :per_page => "" }
      searcher = Spree::Core::Search::Base.new(params)
      searcher.retrieve_products.count.should == 2
    end
  end
end
