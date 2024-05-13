# frozen_string_literal: true

class Post < ApplicationRecord
  validates :message, length: { maximum: 512}
end
