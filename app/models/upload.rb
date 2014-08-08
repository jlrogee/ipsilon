class Upload < ActiveRecord::Base
  attr_accessor :avatar
  belongs_to :attachable, polymorphic: true

  validates :avatar, presence: true
  validates_presence_of :avatar
  validates_associated :attachable, allow_nil: true

  mount_uploader :avatar, AvatarUploader

end
