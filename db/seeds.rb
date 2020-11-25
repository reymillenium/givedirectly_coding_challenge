# frozen_string_literal: true

require 'faker'

BOOKS_AMOUNT = 200

def destroy_existing_books
  Book.destroy_all
end

def seed_the_books
  progress_bar = ProgressBar.create(
    starting_at: 0,
    total: BOOKS_AMOUNT,
    format: '%e %B %P%'
  )

  BOOKS_AMOUNT.times do
    Book.create(title: Faker::Book.title, available: true)
    progress_bar.increment
  end
end

destroy_existing_books
seed_the_books
