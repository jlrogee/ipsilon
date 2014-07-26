class Solution < ActiveRecord::Base
  belongs_to :create_user, class_name: User
  belongs_to :problem
  validates :description, presence: true
  mount_uploader :file, AvatarUploader
  has_many :uploads, :as => :attachable, dependent: :destroy
end
