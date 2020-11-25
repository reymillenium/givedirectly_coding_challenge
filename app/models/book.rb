# frozen_string_literal: true

# rubocop:disable Style/Documentation
class Book < ApplicationRecord

  # Validation:
  validates :title, presence: true

end
