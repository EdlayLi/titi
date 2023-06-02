# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "engri.vlad@gmail.com"
  layout "mailer"
end
