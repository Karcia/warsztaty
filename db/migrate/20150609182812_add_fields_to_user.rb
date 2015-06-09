class AddFieldsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :firstname, :string
  	add_column :users, :lastname, :string
  	add_column :users, :is_admin, :boolean, default: false
  end
end
