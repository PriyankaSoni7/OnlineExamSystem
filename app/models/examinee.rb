class Examinee < ApplicationRecord
  belongs_to :admin
  has_and_belongs_to_many :lists, class_name: 'List', join_table: 'lists_examinees', association_foreign_key: 'list_l_id', foreign_key: 'examinee_id'
  has_one :signup
  has_many :question_sets, dependent: :destroy
  validates :id, :name, :address, :phone_no , :email, :admin_name, :list_l_id, presence: true
  validates :phone_no, numericality: true
  validates :name, :address, presence: true, length: { maximum: 50 } 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false } 
  before_save { |user| user.email = email.downcase } 
  before_save :create_remember_token

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
