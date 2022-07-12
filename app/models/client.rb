class Client < ApplicationRecord
  has_secure_password

  has_many :orders
  validates :email, presence: true, uniqueness: true, email: true
  has_one :basket

  after_create :add_basket_for_client

  private

  def add_basket_for_client
    Basket.create(client_id: self.id)
  end
end
