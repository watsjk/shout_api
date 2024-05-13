# frozen_string_literal: true

class CreateFollows < ActiveRecord::Migration[7.1]
  def change
    create_table :follows do |t|
      t.belongs_to :follower, null: false
      t.belongs_to :following, null: false

      t.timestamps
    end

    add_foreign_key :follows, :accounts, column: :following_id
    add_foreign_key :follows, :accounts, column: :follower_id
  end
end
