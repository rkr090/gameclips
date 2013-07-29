class Screen < ActiveRecord::Base
  belongs_to :user, :dependent => :destroy

  validates :user, presence: true
  validates :name, presence: true, length: {maximum: 30}

  has_attached_file :image
  validates_with AttachmentPresenceValidator, :attributes => :image
  validates_with AttachmentContentTypeValidator, :attributes => :image, :content_type => /image/
end
