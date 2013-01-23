class Attachment < ActiveRecord::Base
  attr_accessible :file, :message, :title, :url, :post_id

  belongs_to :post

  has_many :notes

  mount_uploader :file, FileUploader

  validates_presence_of :title

  before_create :add_title_based_off_attachment

  def add_title_based_off_attachment
  	if_worked = 'false'
  	if self.title == ""
  		if_worked = 'true'
  	end
  	raise if_worked
  end

end
