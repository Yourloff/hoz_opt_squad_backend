class Client < ApplicationRecord
  has_secure_password

  has_many :orders

  validates :email, presence: true, uniqueness: true

  after_create :add_basket_for_client

  private

  # def add_basket_for_client
  #   byebug
  #   client_id = Client.find(params[:id])
  #   Basket.create(client_id: client_id)
  # end
end
