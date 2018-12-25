class Submit < ApplicationRecord
  has_one :list
  validates :no_of_ques_attempt, presence: true
  validates :no_of_ques_attempt, numericality: true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
      csv << product.attributes.values_at(*column_names)
      end
    end
 end
end
