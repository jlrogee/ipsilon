class Upload < ActiveRecord::Base

  belongs_to :attachable, polymorphic: true

  validates :avatar, presence: true
  validates_presence_of :avatar

  #validates_associated :attachable

  mount_uploader :avatar, AvatarUploader

end
