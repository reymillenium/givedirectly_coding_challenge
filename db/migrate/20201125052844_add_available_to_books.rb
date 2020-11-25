class AddAvailableToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :available, :boolean
  end
end
