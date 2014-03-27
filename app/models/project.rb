class Project < ActiveRecord::Base
  belongs_to :user

  has_many :discussions, dependent: :destroy
  has_many :tasks, dependent: :destroy
end