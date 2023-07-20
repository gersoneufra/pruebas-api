require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  before(:each) do
    @user = User.new(email: 'dino@mail.com', name: 'Dino')
    @user.save
  end

  describe "GET /orders" do
    it "returns a list of orders" do
      Order.create(amount: 900, payment_status: 'paid', order_status: 'delivered',
                   payment_date: '2023-07-18T1:21:56.14Z', delivery_date: '2023-07-18T1:21:56.14Z', user_id: @user.id)
      Order.create(amount: 900, payment_status: 'paid', order_status: 'delivered',
                   payment_date: '2023-07-18T1:21:56.14Z', delivery_date: '2023-07-18T1:21:56.14Z', user_id: @user.id)

      get "/orders"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe "GET /orders/:id" do
    it "returns a specific order" do
      order = Order.create(amount: 15, payment_status: 'paid', order_status: 'delivered',
                           payment_date: '2023-07-18T1:21:56.14Z', delivery_date: '2023-07-18T1:21:56.14Z', user_id: @user.id)

      get "/orders/#{order.id}"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["amount"].to_i).to eq(15)
    end
  end

  describe "POST /orders" do
    it "creates a new order" do
      order_params = {
        amount: 100,
        payment_status: 'paid',
        order_status: 'delivered',
        payment_date: '2023-07-18T1:21:56.14Z',
        delivery_date: '2023-07-18T1:21:56.14Z',
        user_id: @user.id
      }

      post "/orders", params: { order: order_params }

      expect(response).to have_http_status(:created)
      expect(Order.count).to eq(1)
      expect(Order.first.amount).to eq(100)
    end
  end
end
