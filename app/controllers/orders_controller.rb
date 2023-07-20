class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  def index
    @orders = Order.all
    render json: @orders, status: :ok
  end

  def show
    render json: @order
  end

  def by_date
    @orders = Order.where(delivery_date: params[:date])
    render json: @orders
  end

  def create
    current_user = User.last
    @user = current_user
    @order = Order.new(order_params)
    @order.user_id = @user.id
    if @order.save
      render json: @order, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    current_user = User.last
    @user = current_user
    if @order.user_id == @user.id
      if @order.update(order_params)
        render json: @order
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if @order
      @order.destroy
      render json: { notice: 'Order deleted successfully!' }, status: 200
    else
      render json: { error: 'Unable to delete order' }, status: 400
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:amount, :payment_status, :order_status, :payment_date, :delivery_date)
  end
end
