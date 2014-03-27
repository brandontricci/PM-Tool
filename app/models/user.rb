class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects
  has_many :discussions
  has_many :comments
  has_many :tasks
  has_many :assignments
  has_many :assigned_tasks, through: :assignments, source: :task
end
