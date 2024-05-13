# frozen_string_literal: true

class Account < ApplicationRecord
  has_secure_password
  validates :uname, presence: true, uniqueness: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { in: 8..20 }, on: create

  has_many :followers, class_name: 'Follow', foreign_key: 'following_id'
  has_many :following, class_name: 'Follow', foreign_key: 'follower_id'
end
