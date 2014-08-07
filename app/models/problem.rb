class Problem < ActiveRecord::Base

  belongs_to :create_user, foreign_key: :create_user_id, class_name: User
  belongs_to :performer_user, foreign_key: :performer_user_id, class_name: User
  belongs_to :last_update_user, foreign_key: :last_update_user_id, class_name: User
  belongs_to :priority, foreign_key: :priority_id, class_name: Priority
  belongs_to :category, foreign_key: :category_id, class_name: Category
  has_many :uploads, :as => :attachable
  has_many :solutions, class_name: Solution

  accepts_nested_attributes_for :solutions
  accepts_nested_attributes_for :uploads

  validates :description, presence: true, length: {maximum: 65500}
  validates_associated  :create_user, :performer_user, :last_update_user, :priority, :category, :solutions, :uploads, allow_nil: true
  self.inheritance_column = :_type_disabled

  state_machine :state, :initial => :new do
    event :switch_to_w do
      transition [:new, :returned, :dispath, :done, :closed] => :work
    end

    event :switch_to_r do
      transition [:work, :dispath] => :returned
    end

    event :switch_to_d do
      transition [:work, :returned] => :dispath
    end

    event :switch_to_dn do
      transition :work => :done
    end

    event :switch_to_c do
      transition [:returned, :done, :dispath] => :closed
    end
  end

  scope :search, -> (query) {where("description like ? ", "%#{query}%")}

  self.per_page = 10

  def show_id
    "Problem #{id}"
  end

  def assigned
    performer_user_id ? performer_user : "------"
  end

  def datex
    priority ? (Date.today + priority.to_i) : Date.today
  end

end
