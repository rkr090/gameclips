class Screen < ActiveRecord::Base
  belongs_to :user, :dependent => :destroy

  validates :user, presence: true
  validates :name, presence: true, length: {maximum: 30}

  has_attached_file :image, :styles => { :midlarge => "550x350>" }
  validates_with AttachmentPresenceValidator, :attributes => :image
  validates_with AttachmentContentTypeValidator, :attributes => :image, :content_type => /image/
  validates_with AttachmentSizeValidator, :attributes => :image, :in => 0..3.megabytes,
                                          :message => 'size limit is 3 MB'
end
