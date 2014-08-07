class Upload < ActiveRecord::Base

  belongs_to :attachable, polymorphic: true

  validates :avatar, presence: true, length: { maximum: 150 }
  validates_presence_of :avatar

  validates_associated :organization, :users

  mount_uploader :avatar, AvatarUploader

end
