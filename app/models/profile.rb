class Profile < ActiveRecord::Base
  belongs_to :user, :dependent => :destroy

  has_attached_file :avatar, :styles => { :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_with AttachmentContentTypeValidator, :attributes => :avatar, :content_type => /image/
  validates_with AttachmentSizeValidator, :attributes => :avatar, :in => 0..3.megabytes,
                                          :message => 'size limit is 3 MB'

end
