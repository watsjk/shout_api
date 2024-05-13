# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_240_512_162_401) do
  create_table 'accounts', force: :cascade do |t|
    t.string 'uname'
    t.string 'email'
    t.string 'password'
    t.string 'password_digest'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_accounts_on_email', unique: true
    t.index ['uname'], name: 'index_accounts_on_uname', unique: true
  end

  create_table 'follows', force: :cascade do |t|
    t.integer 'follower_id', null: false
    t.integer 'following_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['follower_id'], name: 'index_follows_on_follower_id'
    t.index ['following_id'], name: 'index_follows_on_following_id'
  end

  add_foreign_key 'follows', 'accounts', column: 'follower_id'
  add_foreign_key 'follows', 'accounts', column: 'following_id'
end
