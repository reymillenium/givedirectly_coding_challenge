# frozen_string_literal: true

# rubocop:disable Style/Documentation
class Request < ApplicationRecord
  include RequestsHelper

  #  Relations
  belongs_to :book

  # Validations:
  validates :email, presence: true
  validates :email, format: { with: RequestsHelper::VALID_EMAIL_REGEX }
end
