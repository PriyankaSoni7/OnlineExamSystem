class Question < ApplicationRecord
  belongs_to :diff_set
  belongs_to :editability
  validates :ques_no, :first_option, :second_option, :third_option, :fourth_option, :answer, :time_limit, :diff_set_id, :editability_e_id, presence: true
  validates :ques_no, :time_limit, numericality: true
  validates :first_option, :second_option, :third_option, :fourth_option, :answer, length: { maximum: 50 }
  accepts_nested_attributes_for :first_option, :second_option, :third_option, :fourth_option, reject_if: lambda { |a| a[:content].blank? }, allow_destroy: true 
end
