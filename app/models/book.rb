# frozen_string_literal: true

# rubocop:disable Style/Documentation
class Book < ApplicationRecord
  # Relations:
  has_one :request, dependent: :destroy

  # Validation:
  validates :title, presence: true
end
