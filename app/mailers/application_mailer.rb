class ApplicationMailer < ActionMailer::Base
  default from: "no_replay@dw.com"
  layout "mailer"
end
