class Priority < ActiveRecord::Base
  has_many :problems

  self.per_page = 10

  validates :prname, presence: true, length: {minimum: 2, maximum: 50}
  validates :days_to_close, presence: true, numericality: {:greater_than => 0, :only_integer => true}, length: {maximum: 3}

  def to_s
    "#{prname}"
  end

  def to_i
    days_to_close
  end

end
