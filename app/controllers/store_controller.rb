class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  skip_before_action :authorize
  def index
    if params[:set_locale]
      redirect_to store_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
      @counter = count_number_of_visit_to_store_page
      @message = "You have visited this page #@counter times" if @counter > 5
    end
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
