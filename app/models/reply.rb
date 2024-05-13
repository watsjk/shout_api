# frozen_string_literal: true

class Reply < ApplicationRecord
  validates :message, presence: true, length: { maximum: 512 }
  belongs_to :post
  belongs_to :account
end
