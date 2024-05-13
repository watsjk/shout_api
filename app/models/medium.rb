# frozen_string_literal: true

class Medium < ApplicationRecord
  validates :url, presence: true, length: { maximum: 512 }
  validates :kind, presence: true, inclusion: { in: %w[image video] }
  belongs_to :post
end
