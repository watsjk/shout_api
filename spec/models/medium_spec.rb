require 'rails_helper'

RSpec.describe Medium, type: :model do
  media = Medium.new :url => ''
  it 'should be invalid if url length greater than 512' do
    513.times do
      media.url += 'u'
    end
    expect(media).to_not be_valid
  end
end
