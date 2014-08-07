class Priority < ActiveRecord::Base
  has_many :problems

  self.per_page = 10

  def to_s
    "#{prname}"
  end

  def to_i
    days_to_close
  end

end
