class User < ActiveRecord::Base

  has_many :uploads,      :as => :attachable, dependent: :destroy

  has_many :create_kb,    :foreign_key => "create_user_id", class_name: "KnowledgeBase"
  has_many :update_kb,    :foreign_key => "update_user_id", class_name: "KnowledgeBase"

  has_many :create_pb,    :foreign_key => "create_user_id", class_name: "Problem"
  has_many :update_pb,    :foreign_key => "last_update_user_id", class_name: "Problem"
  has_many :performer_pb, :foreign_key => "performer_user_id", class_name: "Problem"

  has_many :solutions,    :foreign_key => "create_user_id", class_name: "Solution"

  belongs_to :departament

  extend Enumerize
  enumerize :role, in: { user: 1, spec: 2, dispatcher: 3, admin: 4 }, default: :user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  accepts_nested_attributes_for :uploads

  validates_acceptance_of :agree, :on => :create

  self.per_page = 10

  scope :search, -> (query) {where("email like ? OR firstname like ? OR lastname like ? OR phone like ?",
                                  "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")}
  def fio
    "#{firstname} #{lastname}"
  end
  def to_s
    fio + " #{email}"
  end

end

