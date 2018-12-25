class Admin < ApplicationRecord
  has_many :editabilitys, dependent: :destroy
  has_many :examinees, dependent: :destroy
  validates :name, :address, :phone_no, presence: true
  validates :phone_no, numericality: true
end
