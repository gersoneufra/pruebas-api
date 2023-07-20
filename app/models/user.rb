class User < ApplicationRecord
  has_many :orders, dependent: :delete_all

  validates :email, :name, presence: true
  validates :name, length: { maximum: 80 }
end
