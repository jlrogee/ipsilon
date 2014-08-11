class KnowledgeBase < ActiveRecord::Base

  belongs_to :create_user, class_name: 'User'
  belongs_to :update_user, class_name: 'User'

  has_many :uploads, :as => :attachable, dependent: :destroy

  accepts_nested_attributes_for :uploads

  validates :kbname, presence: true, uniqueness: true, length: { maximum: 250}
  validates :description, :instruction, presence: true, length: { maximum: 65500 }
  validates :type, presence: true

  extend Enumerize
  enumerize :type, in: { inst: 1, kb: 2 }

  scope :instr, -> { where("type = 1") }
  scope :kb, -> { where("type = 2") }

  self.inheritance_column = :_type_disabled
  self.per_page = 10

  searchable do
    text :kbname, :description, :instruction

    integer :type
    integer :create_user_id
    time    :created_at
    time    :updated_at

    string  :sort_kbname do
      kbname.downcase.gsub(/^(an?|the)/, '')
    end
  end

end
