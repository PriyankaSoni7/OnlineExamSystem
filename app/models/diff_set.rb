class DiffSet < ApplicationRecord
  belongs_to :question_set
  has_one :submit
  has_many :questions, dependent: :destroy
  validates :id, :easy, :medium, :difficult, :question_set_sub_id, presence: true
  validates :id, numericality: true
  validates :easy, :medium, :difficult, length: { maximum: 50 } 
end
