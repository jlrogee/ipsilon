class Problem < ActiveRecord::Base
  belongs_to :create_user, class_name: User
  belongs_to :performer_user, class_name: User
  belongs_to :last_update_user, class_name: User
  belongs_to :priority
  validates :description, presence: true
  has_many :uploads, :as => :attachable
  

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

end