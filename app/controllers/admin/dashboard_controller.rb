class Admin::DashboardController < ApplicationController
  def show
    @products = Product.count(:name)
    @categories = Category.count(:name)
  end
end
