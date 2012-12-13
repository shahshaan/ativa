class Note < ActiveRecord::Base
  attr_accessible :post_id, :text, :user_id

  belongs_to :post

  belongs_to :user
end
