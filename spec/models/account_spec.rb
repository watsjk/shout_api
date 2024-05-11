require 'rails_helper'

RSpec.describe Account, type: :model do
  account = Account.new uname: 'Acme', email: 'acme@test.com', password: 'verysecret'

  it "should valid if required attributes are set." do
    expect(account).to be_valid
  end

  it 'should invalid if :uname absence' do
    account.uname = nil
    expect(account).to be_invalid
  end

  it 'should invalid if :email absence' do
    account.email = nil
    expect(account).to be_invalid
  end

  it 'should invalid if :password absence' do
    account.password = nil
    expect(account).to be_invalid
  end

  it 'should invalid if :uname length less than 2 characters' do
    account.uname = 'A'
    expect(account).to be_invalid
  end

  it 'should invalid if :uname length greater than 20 characters' do
    account.uname = 'Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
    expect(account).to be_invalid
  end

  it 'should invalid if :email format is incorrect' do
    account.email = 'a.b.c@@e.co.th'
    expect(account).to be_invalid
  end
end
