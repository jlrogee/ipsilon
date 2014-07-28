class User < ActiveRecord::Base

  extend Enumerize
  enumerize :role, in: { user: 1, spec: 2, dispatcher: 3, admin: 4 }, default: :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :uploads, :as => :attachable, dependent: :destroy
  accepts_nested_attributes_for :uploads
  has_many :knowledge_bases, :foreign_key => "create_user"
  has_many :knowledge_bases, :foreign_key => "update_user"
  has_many :problems, :foreign_key => "create_user"
  has_many :problems, :foreign_key => "last_update_user"
  has_many :problems, :foreign_key => "performer_user"
  has_many :solutions, :foreign_key => "create_user"
  belongs_to :departament
end
