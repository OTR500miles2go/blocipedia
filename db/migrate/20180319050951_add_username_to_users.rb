class AddUsernameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :role, :integer 
    add_index :users, :username, unique: true
  end
end