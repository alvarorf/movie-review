require 'rails_helper'

RSpec.describe User, type: :model do
  it "Should fail if we try to create an empty user" do
    expect(User.new).to_not be_valid
  end
  it 'Should be valid' do
    expect(User.new(username: 'user1', fullname: 'User 1', password: '123456', email: '123@123.com')).to be_valid
  end
end
