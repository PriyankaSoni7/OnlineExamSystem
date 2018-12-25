class Signup < ApplicationRecord
  has_many :levels, dependent: :destroy
  validates :id, :first_name, :last_name, :address , :phone_no, :college_name, presence: true
  validates :phone_no, numericality: true
  validates :first_name, :last_name, :address, :college_name, length: { maximum: 50 } 
end
