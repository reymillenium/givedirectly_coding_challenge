class RemoveAvailableFromBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :available
  end
end
