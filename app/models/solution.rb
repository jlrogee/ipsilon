class Solution < ActiveRecord::Base
  belongs_to  :create_user, foreign_key: :create_user_id, class_name: User
  belongs_to  :problem, class_name: Problem
  has_many    :uploads, :as => :attachable, dependent: :destroy

  accepts_nested_attributes_for :uploads

  validates   :description, presence: true, length: { maximum: 65500 }

end
