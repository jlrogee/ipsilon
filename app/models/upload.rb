class Upload < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true
  mount_uploader :avatar, AvatarUploader
end
