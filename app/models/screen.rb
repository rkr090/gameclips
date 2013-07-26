class Screen < ActiveRecord::Base
  belongs_to :user, :dependent => :destroy

  validates :image, :attachment_presence => true
  validates_with AttachmentPresenceValidator, :attributes => :image

  has_attached_file :image
end
