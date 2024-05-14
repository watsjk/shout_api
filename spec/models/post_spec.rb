# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  post = Post.new :message => ''
  it 'should be invalid if message length greater than 512' do
    513.times do
      post.message += 'm'
    end
    expect(post).to_not be_valid
  end
end
