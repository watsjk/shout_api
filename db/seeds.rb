# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[
  { uname: 'mr1', email: 'mr1@shout.com', password: 'mr1secret' },
  { uname: 'mr2', email: 'mr2@shout.com', password: 'mr2secret' },
  { uname: 'mr3', email: 'mr3@shout.com', password: 'mr3secret' }
].each { |account| Account.find_or_create_by account }

[
  { account_id: 1, message: 'Mr1 first post!' },
  { account_id: 1, message: 'Mr1 first private post!', private: true },
  { account_id: 1, message: 'Mr1 second post!' },
  { account_id: 2, message: 'Mr2 first post!' },
  { account_id: 3, message: 'Mr3 first post!' },
  { account_id: 3, message: 'Mr3 second post!' }
].each { |post| Post.find_or_create_by post }

[
  { post_id: 1, url: 'https://random.imagecdn.app/500/500', kind: 'image' },
  { post_id: 3, url: 'https://random.imagecdn.app/500/500', kind: 'image' },
  { post_id: 4, url: 'https://random.imagecdn.app/500/500', kind: 'image' },
  { post_id: 5, url: 'https://random.imagecdn.app/500/500', kind: 'image' },
  { post_id: 6, url: 'https://random.imagecdn.app/500/500', kind: 'image' }
].each { |media| Medium.find_or_create_by media }

[
  { follower_id: 2, following_id: 3 },
  { follower_id: 3, following_id: 1 },
  { follower_id: 3, following_id: 2 }
].each { |follow| Follow.find_or_create_by follow }

[
  { account_id: 3, post_id: 1 },
  { account_id: 3, post_id: 5 }
].each { |fav| Favorite.find_or_create_by fav }

[
  { account_id: 3, post_id: 1, message: '😍' },
  { account_id: 3, post_id: 3, message: '👍' },
  { account_id: 3, post_id: 4, message: '🤣' },
  { account_id: 3, post_id: 5, message: '😉' },
  { account_id: 3, post_id: 6, message: '☺️' }
].each { |reply| Reply.find_or_create_by reply }
