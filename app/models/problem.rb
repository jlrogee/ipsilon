class Problem < ActiveRecord::Base

  belongs_to :create_user, foreign_key: :create_user_id, class_name: User
  belongs_to :performer_user, foreign_key: :performer_user_id, class_name: User
  belongs_to :last_update_user, foreign_key: :last_update_user_id, class_name: User
  belongs_to :priority, foreign_key: :priority_id, class_name: Priority
  belongs_to :category, foreign_key: :category_id, class_name: Category
  has_many :uploads, :as => :attachable
  has_many :solutions
  belongs_to :asset
  accepts_nested_attributes_for :solutions
  accepts_nested_attributes_for :uploads

  validates :description, presence: true, length: {maximum: 65500}
  validates_associated :solutions

  self.inheritance_column = :_type_disabled

  extend Enumerize
  enumerize :qualification, in: { VeryPoor: 1, Poor: 2, Satisfactory: 3, Good: 4, Excellent: 5 }

  state_machine :state, :initial => :new do
    event :switch_to_w do
      transition [:new, :dispatch, :closed] => :work
    end

    event :switch_to_d do
      transition :work => :dispatch
    end

    event :switch_to_c do
      transition [:work, :dispatch] => :closed
    end
  end

  default_scope {order("created_at DESC")}
  scope :search, -> (query) {where("description like ? ", "%#{query}%")}
  scope :ind, -> (query) {where("(create_user_id = ? OR performer_user_id = ?) AND state NOT IN ('closed', 'done')",
                                "#{query}", "#{query}")}
  scope :filter_admin, -> (query) {where("state = ?", "#{query}")}
  scope :filter, -> (query, query1) {where("state = ? AND (create_user_id = ? OR performer_user_id = ?)", "#{query}",
                                           "#{query1}", "#{query1}")}
  scope :start, -> {where("state NOT IN ('closed', 'done')")}
  scope :all_problem_adm, -> {order("created_at DESC")}
  scope :all_problem, -> (query) {where("create_user_id = ? OR performer_user_id = ?", "#{query}", "#{query}")}

  self.per_page = 10

  def show_id
    "Problem #{id}"
  end

  def assigned
    performer_user_id ? performer_user : "------"
  end

  def datex
    priority ? Time.at( created_at.to_time.to_i + (priority.to_i * 86400) ).strftime("%Y-%m-%d"): created_at.strftime("%Y-%m-%d")
  end

end
