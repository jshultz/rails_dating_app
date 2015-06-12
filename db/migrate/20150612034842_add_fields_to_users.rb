class AddFieldsToUsers < ActiveRecord::Migration
  def up
    add_column :users, :age, :integer
    add_column :users, :birth_date, :string
    add_column :users, :gender, :integer
    add_column :users, :city, :string
  end

  def down
    remove_column :users, :age
    remove_column :users, :birth_date
    remove_column :users, :gender
    remove_column :users, :city
  end
end
