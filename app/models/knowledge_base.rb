class KnowledgeBase < ActiveRecord::Base
  extend Enumerize
  enumerize :type, in: { inst: 1, kb: 2 }

  belongs_to :create_user_id, class_name: User
  belongs_to :update_user_id, class_name: User
  validates_presence_of :kbname
  has_many :uploads, :as => :attachable, dependent: :destroy
  accepts_nested_attributes_for :uploads
end
