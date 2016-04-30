class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.text :description
      t.boolean :sold
      t.integer :price
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.datetime :start_date
      t.datetime :end_date

      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :listings, [:user_id, :created_at]
  end
end
