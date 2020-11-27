# frozen_string_literal: true

# rubocop:disable Style/Documentation
class Book < ApplicationRecord
  # Relations:
  has_one :request, dependent: :destroy

  # Validations:
  validates :title, presence: true
end
