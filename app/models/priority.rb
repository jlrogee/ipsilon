class Priority < ActiveRecord::Base
  has_many :problems

  self.per_page = 10

  validates :prname, presence: true, length: {minimum: 2}

  def to_s
    "#{prname}"
  end

  def to_i
    days_to_close
  end

end
