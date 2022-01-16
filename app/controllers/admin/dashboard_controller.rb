class Admin::DashboardController < ApplicationController
  def show
    @product_count = Product.all.count
    @category_count = Product.all.count
  end

end
