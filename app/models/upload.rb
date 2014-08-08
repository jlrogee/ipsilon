class Upload < ActiveRecord::Base
  attr_accessor :avatar
  belongs_to :attachable, polymorphic: true

  validates :avatar, presence: true
  validates_presence_of :avatar

  mount_uploader :avatar, AvatarUploader

end
