class KnowledgeBase < ActiveRecord::Base

  belongs_to :create_user, class_name: 'User'
  belongs_to :update_user, class_name: 'User'

  has_many :uploads, :as => :attachable, dependent: :destroy

  accepts_nested_attributes_for :uploads

  validates_presence_of :kbname

  extend Enumerize
  enumerize :type, in: { inst: 1, kb: 2 }
end
