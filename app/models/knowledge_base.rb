class KnowledgeBase < ActiveRecord::Base

  belongs_to :create_user, class_name: 'User'
  belongs_to :update_user, class_name: 'User'

  has_many :uploads, :as => :attachable, dependent: :destroy

  accepts_nested_attributes_for :uploads

  validates :kbname, presence: true, uniqueness: true, length: { maximum: 250}
  validates :description, :instruction, length: { maximum: 65500 }
  validates_associated :create_user, :update_user, :uploads, allow_nil: true

  extend Enumerize
  enumerize :type, in: { inst: 1, kb: 2 }

  scope :instr, -> { where("type = 1") }
  scope :kb, -> { where("type = 2") }
  scope :search, -> (query) { where("kbname like ? OR description like ? OR instruction like ?", "%#{query}%", "%#{query}%", "%#{query}%")}

  self.inheritance_column = :_type_disabled
  self.per_page = 10
end
