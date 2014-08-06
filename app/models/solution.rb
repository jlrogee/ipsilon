class Solution < ActiveRecord::Base
  belongs_to  :create_user, class_name: User
  belongs_to  :problem, class_name: Problem
  has_many    :uploads, :as => :attachable, dependent: :destroy

  validates   :description, presence: true, length: { maximum: 65500 }
end
