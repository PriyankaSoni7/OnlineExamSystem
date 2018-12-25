class Editability < ApplicationRecord
  belongs_to :admin
  has_many :question_sets, dependent: :destroy
  has_many :questions, dependent: :destroy
  validates :e_id, :activate, :deactivate, :add_new_ques, :add_option, :admin_name, presence: true
  validates :e_id, numericality: true
 
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.role? :guest
      #You can not do anything

    end

    if user.role? :student
      #can read

    end


    if user.role? :admin
      can :manage, User
      can :manage, Question
     
    end
end

end
