class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string
    add_column :users, :birthday, :string
    add_column :users, :phone, :string
  end
end
