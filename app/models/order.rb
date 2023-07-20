class Order < ApplicationRecord
  belongs_to :user

  PAYMENT_STATUSES = ['paid', 'unpaid', 'pending'].freeze
  ORDER_STATUSES = ['received', 'preparing', 'delivering', 'delivered'].freeze

  validates :amount, presence: true
  validates :payment_status, inclusion: { in: PAYMENT_STATUSES }
  validates :order_status, inclusion: { in: ORDER_STATUSES }
  validate :validate_payment_and_delivery_presence

  private

  def validate_payment_and_delivery_presence
    if payment_status == 'paid'
      errors.add(:payment_date, "payment_date must be present for paid orders") if payment_date.blank?

      if order_status == 'delivered'
        errors.add(:delivery_date, "delivery_date must be present for delivered status") if delivery_date.blank?
      else
        errors.add(:delivery_date,
                   "delivery_date must not be present for order status other than delivered") if delivery_date.present?
      end
    elsif (payment_status == 'unpaid' || payment_status == 'pending') && order_status == 'delivered'
      errors.add(:payment_date,
                 "payment_date must be present for delivered orders with unpaid or pending payment status") if payment_date.blank?
    else
      errors.add(:payment_date,
                 "payment_date must not be present for orders with payment status other than paid or delivered with unpaid or pending payment status") if payment_date.present?
    end
  end
end
