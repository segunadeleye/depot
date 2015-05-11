class ApplicationMailer < ActionMailer::Base
  default from: " Order Confirmation <order@dealdey.com>",
          cc: "highzik88@gmail.com"
  layout 'mailer'
end
