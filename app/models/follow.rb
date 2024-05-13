# frozen_string_literal: true

class Follow < ApplicationRecord
  belongs_to :follower, class_name: 'Account'
  belongs_to :following, class_name: 'Account'
end
