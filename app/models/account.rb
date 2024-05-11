class Account < ApplicationRecord
  has_secure_password
  validates :uname, presence: true, uniqueness: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { in: 8..20 }, on: create
end
