require 'rails_helper'

RSpec.describe Favorite, type: :model do
  fav = Favorite.new post_id: 1, account_id: 1

  it 'should invalid if :post_id absence' do
    fav.post_id = nil
    expect(fav).to be_invalid
  end

  it 'should invalid if :account_id absence' do
    fav.account_id = nil
    expect(fav).to be_invalid
  end
end
