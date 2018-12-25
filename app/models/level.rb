class Level < ApplicationRecord
  belongs_to :signup
  has_many :question_sets, dependent: :destroy
  validates :id, :fresher, :intermediate, :experienced , :signup_id, presence: true
  validates :fresher, :intermediate, :experienced, length: { maximum: 50 } 
end
