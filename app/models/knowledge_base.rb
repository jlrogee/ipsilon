class KnowledgeBase < ActiveRecord::Base

  belongs_to :create_user, class_name: 'User'
  belongs_to :update_user, class_name: 'User'

  has_many :uploads, :as => :attachable, dependent: :destroy

  accepts_nested_attributes_for :uploads

  validates_presence_of :kbname
  validates_uniqueness_of :kbname

  extend Enumerize
  enumerize :type, in: { inst: 1, kb: 2 }

  def self.instr
    where("type = 1")
  end

  def self.kb
    where("type = 2")
  end

  scope :search, -> (query) { where("kbname like ? OR description like ? OR instruction like ?", "%#{query}%", "%#{query}%", "%#{query}%")}

  self.inheritance_column = :_type_disabled
  self.per_page = 10
end
