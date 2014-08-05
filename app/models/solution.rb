class Solution < ActiveRecord::Base
  belongs_to  :create_user, class_name: User
  has_many    :problems
  has_many    :uploads, :as => :attachable, dependent: :destroy

  validates   :description, presence: true, length: { maximum: 65535 }
  validates_associated :create_user, :problems, :uploads
end
