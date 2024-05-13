# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Follow, type: :model do
  follow = Follow.new follower_id: 2, following_id: 1

  it 'should invalid if :follower_id absence' do
    follow.follower_id = nil
    expect(follow).to be_invalid
  end

  it 'should invalid if :following_id absence' do
    follow.following_id = nil
    expect(follow).to be_invalid
  end
end
