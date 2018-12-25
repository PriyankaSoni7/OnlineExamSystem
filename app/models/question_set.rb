class QuestionSet < ApplicationRecord
  belongs_to :examinee
  belongs_to :level
  belongs_to :editability
  has_many :diff_sets, dependent: :destroy
  validates :sub_id, :sub_name, :no_of_ques, :examinee_id, :level_id, :editability_e_id, presence: true
  validates :no_of_ques, numericality: true
  validates :sub_name, length: { maximum: 50 } 
end
