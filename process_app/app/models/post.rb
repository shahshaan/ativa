class Post < ActiveRecord::Base
  attr_accessible :attachment, :comment, :message, :phase_id, :title, :user_id
end
