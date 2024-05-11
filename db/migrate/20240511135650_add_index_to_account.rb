class AddIndexToAccount < ActiveRecord::Migration[7.1]
  def change
    add_index :accounts, :uname, unique: true
    add_index :accounts, :email, unique: true
  end
end
