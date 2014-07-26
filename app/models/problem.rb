class Problem < ActiveRecord::Base
  belongs_to :create_user, class_name: User
  belongs_to :performer_user, class_name: User
  belongs_to :last_update_user, class_name: User
  validates :description, presence: true
  mount_uploader :file, AvatarUploader
  has_many :uploads, :as => :attachable

  state_machine :initial => :new do
    state :work
    state :reply
    state :returned
    state :done
    state :closed
    state :dispath
  end

end
