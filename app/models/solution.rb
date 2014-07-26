class Solution < ActiveRecord::Base
  belongs_to  :create_user, class_name: User
  belongs_to  :problem
  belongs_to  :state, class_name: Problem
  validates   :description, presence: true
  has_many    :uploads, :as => :attachable, dependent: :destroy
end
