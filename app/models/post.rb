class Post < ActiveRecord::Base
  attr_accessible :attachment, :private, :phase, :message, :project_id, :title, :user_id, :attachment_file_name, :attachment_content_type, :attachment_file_size, :attachment_updated_at

  belongs_to :project
  
  belongs_to :user


  has_attached_file 	:attachment,
    					:storage => :s3,
    					:bucket => 'perfectsearchdesign',
    					:s3_credentials => {
    						:access_key_id => ENV['AMAZONS3_ACCESS_KEY'],
    						:secret_access_key => ENV['AMAZONS3_SECRET_ACCESS_KEY']
    					}
    					
   validates_attachment_content_type 	:attachment,
         								:content_type => [
         									'application/pdf',
         									/^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/,
         									/^application\/(doc|docx|xls|xlsx|ppt|pptx)$/],
         								:message => "- Eek, we couldn't upload that file type (we currenlty only accept pictures, pdfs, docs, spreadsheets, and powerpoints)"
    def project
        
    end

end
