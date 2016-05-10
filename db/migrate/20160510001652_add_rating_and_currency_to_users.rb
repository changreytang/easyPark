class AddRatingAndCurrencyToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :rating, :integer
  	add_column :users, :rating_counter, :integer, :default => 0
  	add_column :users, :balance, :integer, :default => 200
  end
end
