require 'spec_helper'

describe Spree::Taxon do

  before do
    stock_location = create(:stock_location, backorderable_default: false)
    @product_with_stock = create(:product)
    @product_out_of_stock = create(:product)

    stock_location.stock_items.where(:variant_id => @product_with_stock.master.id).first.adjust_count_on_hand(10)
    stock_location.stock_items.where(:variant_id => @product_out_of_stock.master.id).first.adjust_count_on_hand(0)

    @taxonomy = create(:taxonomy)
    @root_taxon = @taxonomy.root

    @parent_taxon = create(:taxon, :name => 'Parent', :taxonomy_id => @taxonomy.id, :parent => @root_taxon)
    @child_taxon = create(:taxon, :name =>'Child 1', :taxonomy_id => @taxonomy.id, :parent => @parent_taxon)
    @parent_taxon.reload # Need to reload for descendents to show up

    @product_with_stock.taxons << @parent_taxon
    @product_with_stock.taxons << @child_taxon
    @product_out_of_stock.taxons << @parent_taxon
    @product_out_of_stock.taxons << @child_taxon
  end

  context "with show_zero_stock_products = FALSE" do

    before do
      Spree::Config[:show_zero_stock_products] = false
    end

    it "includes a product with available stock" do
      @parent_taxon.active_products.should include @product_with_stock
    end

    it "excludes a product without available stock" do
      @parent_taxon.active_products.should_not include @product_out_of_stock
    end
  end

  context "with show_zero_stock_products = TRUE" do

    before do
      Spree::Config[:show_zero_stock_products] = true
    end

    it "includes both products with and without stock" do
      @parent_taxon.active_products.should include @product_with_stock
      @parent_taxon.active_products.should include @product_out_of_stock
    end
  end
end
