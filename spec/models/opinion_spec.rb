require 'rails_helper'

RSpec.describe Opinion, type: :model do
  it "Should fail if we try to create an empty opinion" do
    expect(Opinion.new).to_not be_valid
  end
  it 'Should be valid' do
    u = User.create(username: 'user1', fullname: 'User 1', password: '123456', email: '123@123.com')
    expect(Opinion.new(user_id: u.id, text: 'First opinion, by User 1')).to be_valid
  end
end
