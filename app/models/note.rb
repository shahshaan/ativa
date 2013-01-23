class Note < ActiveRecord::Base
  attr_accessible :post_id, :text, :user_id, :attachment_id

  belongs_to :user
  belongs_to :post
  belongs_to :attachment
end
