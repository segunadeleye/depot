class OrderNotifier < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order

    # without a block, it defaults to using the HTML template -> mailer.html.erb
    mail to: order.email, subject: "O'Trendy Store Order Confirmation" do |format|
      format.text # uses mailer.text.erb
    end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
    @order = order

    # defaults to using html template
    mail to: order.email, subject: "O'Trendy Store Order Shipped"
  end
end
