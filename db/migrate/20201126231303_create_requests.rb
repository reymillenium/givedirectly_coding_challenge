class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :email
      t.belongs_to :book

      t.timestamps
    end
  end
end
