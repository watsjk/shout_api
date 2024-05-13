# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :uname
      t.string :email
      t.string :password
      t.string :password_digest

      t.timestamps
    end

    add_index :accounts, :uname, unique: true
    add_index :accounts, :email, unique: true
  end
end
