class Task < ActiveRecord::Base
  has_many :assignments, dependent: :destroy
  has_many :users, through: :assignments

  belongs_to :project
  belongs_to :user

  scope :complete, -> { where(complete: true)}
  scope :incomplete, -> { where(complete: false)}

  
end
