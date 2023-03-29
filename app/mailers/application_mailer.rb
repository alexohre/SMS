# frozen_string_literal: true

# The default mailer handler of the application
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
