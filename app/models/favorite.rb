# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :account
  belongs_to :post
end
