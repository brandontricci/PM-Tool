class Comment < ActiveRecord::Base
  belongs_to :discussion

  belongs_to :user
end
