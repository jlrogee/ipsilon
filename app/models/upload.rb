class Upload < ActiveRecord::Base

  belongs_to :attachable, polymorphic: true

  validates_presence_of :avatar

  mount_uploader :avatar, AvatarUploader

end
