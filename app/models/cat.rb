class Cat < ActiveRecord::Base
  validates :color, :name, :sex, :birth_date, presence: true
  validates :color, inclusion: { in: %w(black white orange calico grey), message: "%{value} is not a valid color" }
  validates :sex, inclusion: { in: %w(M F), message: "%{value} is not a valid option" }

  def age
    (Date.today - self.birth_date).to_i / 365
  end
  
end
