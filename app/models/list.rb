class List < ApplicationRecord
  has_and_belongs_to_many :examinees, class_name: 'Examinee', join_table: 'lists_examinees', association_foreign_key: 'examinee_id', foreign_key: 'list_l_id'
  validates :l_id, :marks, :pass, :fail, :examinee_id, presence: true
  validates :marks, numericality: true
end
