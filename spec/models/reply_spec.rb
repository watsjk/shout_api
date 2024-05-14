require 'rails_helper'

RSpec.describe Reply, type: :model do
  reply = Reply.new :message => ''
  it 'should be invalid if message length greater than 512' do
    513.times do
      reply.message += 'm'
    end
    expect(reply).to_not be_valid
  end
end
