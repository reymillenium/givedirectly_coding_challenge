# frozen_string_literal: true

# rubocop:disable Style/Documentation
module RequestsHelper
  VALID_EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP

  def a_valid_email?(email)
    !(email =~ VALID_EMAIL_REGEX).nil?
  end
end
