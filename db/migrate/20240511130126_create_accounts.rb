class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :uname
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
