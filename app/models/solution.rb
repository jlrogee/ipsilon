class Solution < ActiveRecord::Base
  belongs_to  :create_user, class_name: User
  has_many    :problem
  validates   :description, presence: true
  has_many    :uploads, :as => :attachable, dependent: :destroy
end
