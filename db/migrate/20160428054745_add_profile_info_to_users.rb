class AddProfileInfoToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :email, :string
  	add_column :users, :phone_number, :string
  	add_column :users, :description, :text
  	add_column :users, :home_town, :text
  end
end
