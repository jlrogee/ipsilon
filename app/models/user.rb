class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :uploads, :as => :attachable

  extend Enumerize
  enumerize :role, in: { user: 1, spec: 2, dispatcher: 3, admin: 4 }

end
