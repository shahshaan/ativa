class Post < ActiveRecord::Base
  attr_accessible :attachment, :private, :phase, :message, :project_id, :title, :user_id, :url

  belongs_to :project
  
  belongs_to :user

  has_many :notes

  has_many :attachments

  has_many :subposts

  mount_uploader :attachment, AttachmentUploader

  after_update :set_post_last_updated

  before_create :insert_underscore_in_message

  validates_presence_of :title
  validates_presence_of :message

  def insert_underscore_in_message
    self.message ||= "-"
  end

  def set_post_last_updated
    project = Project.find(self.project_id)
    project.update_attributes(:post_last_updated => self.updated_at)
  end

  def snippet
    title_size = self.title.size * 1.2
    message_size = 120 - title_size
    snippet = self.message.truncate(message_size, :separator => ' ')
    return snippet
  end

  def attachment_snippet
    text = ""
    if self.attachment? then text = self.attachment.file.filename end
    return text.truncate(34, :separator => "")
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
