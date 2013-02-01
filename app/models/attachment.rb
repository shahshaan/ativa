class Attachment < ActiveRecord::Base
  attr_accessible :file, :message, :title, :url, :post_id, :user_id

  attr_accessor :user_id

  belongs_to :post

  has_many :notes

  mount_uploader :file, FileUploader

  validates_presence_of :title, :if => :attachment_not_attached

  before_create :add_title_based_off_attachment

  def attachment_not_attached
    if self.url != "" || self.file.file != nil
      return false
    else
      return true
    end
  end

  def add_title_based_off_attachment
    if self.title == ""
      if self.url then replacement_title = self.url end
      if self.file.file != nil
        file_name = self.file.file.filename
        title_array = file_name.match(/(.*)\.(.*)/)[1..2]
        replacement_title = title_array[0].gsub(/'_'/, ' ')
      end
      self.title = replacement_title
    end
  end

end
