require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(email: 'dino@mail.com', name: 'Dino')
    @user.save
    @user2 = User.new(email: 'ronald@mail.com', name: 'Ronald')
    @user2.save
    @order = Order.new(amount: 900, payment_status: 'paid', order_status: 'delivered',
                       payment_date: '2023-07-18T1:21:56.14Z', delivery_date: '2023-07-18T1:21:56.14Z', user_id: @user.id)
    @order.save
  end

  it 'amount should be present' do
    expect(@order).to be_valid
    @order.amount = nil
    expect(@order).to_not be_valid
  end

  it 'payment_status should have in the validation array only: paid, unpaid, pending' do
    expect(@order).to be_valid
    @order.payment_status = 'nopaid'
    expect(@order).to_not be_valid
  end

  it 'payment_date should be exist when payment_status is equal to paid' do
    expect(@order).to be_valid
    @order.payment_date = nil
    @order.order_status = 'delivering'
    @order.payment_date = nil
    expect(@order).to_not be_valid
  end

  it 'order_status should have in the validation array only: received, preparing, delivering, delivered' do
    expect(@order).to be_valid
    @order.order_status = 'nodelivered'
    @order.payment_date = nil
    expect(@order).to_not be_valid
  end

  it 'delivery_date should be exist when order_status is equal to delivered' do
    expect(@order).to be_valid
    @order.payment_date = nil
    expect(@order).to_not be_valid
  end

  it 'payment_status is not paid you can enter a delivered value in order_status' do
    expect(@order).to be_valid
    @order.payment_status = 'unpaid'
    @order.payment_date = nil
    expect(@order).to_not be_valid
  end
end
