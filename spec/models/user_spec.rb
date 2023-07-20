require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(email: 'dino@mail.com', name: 'Dino')
    @user.save
  end

  it 'email should be present' do
    expect(@user).to be_valid
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'name should be present' do
    expect(@user).to be_valid
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'name should not be too long' do
    @user.name = 'a' * 100
    expect(@user).to_not be_valid
  end
end
