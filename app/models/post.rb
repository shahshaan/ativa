class Post < ActiveRecord::Base
  attr_accessible :attachment, :private, :phase, :message, :project_id, :title, :user_id, :attachment_file_name, :attachment_content_type, :attachment_file_size, :attachment_updated_at

  belongs_to :project
  
  belongs_to :user

  mount_uploader :attachment, AttachmentUploader

  def snippet
    title_size = self.title.size * 1.2
    message_size = 120 - title_size
    snippet = self.message.truncate(message_size, :separator => ' ')
    return snippet
  end

  def today
  	today = Time.now
  	self.where(["updated_at >= ? AND updated_at <= ?", today.beginning_of_day, today.end_of_day]).sort! { |a,b| b.updated_at <=> a.updated_at }
  end

  def yesterday
  	yesterday = Time.now - 1.day
  	self.where(["updated_at >= ? AND updated_at <= ?", yesterday.beginning_of_day, yesterday.end_of_day])
  end

  def older_than_yesterday
  	day_before_yesterday = Time.now - 2.day
  	self.where(["updated_at <= ?", day_before_yesterday.end_of_day])
  end

end
