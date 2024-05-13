# frozen_string_literal: true

class CreateReplies < ActiveRecord::Migration[7.1]
  def change
    create_table :replies do |t|
      t.string :message
      t.belongs_to :post, null: false, foreign_key: true
      t.belongs_to :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end