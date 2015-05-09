class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index
    @products = Product.order(:title)
    @counter = count_number_of_visit_to_store_page
    @message = "You have visited this page #@counter times" if @counter > 5
  end

  private
    def count_number_of_visit_to_store_page
      if session[:counter].nil?
        session[:counter] = 0
      else
        session[:counter] += 1
      end
    end
end
