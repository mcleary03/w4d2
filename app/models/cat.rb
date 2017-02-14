# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#

class Cat < ActiveRecord::Base
  validates :color, :name, :sex, :birth_date, presence: true
  validates :color, inclusion: { in: %w(black white orange calico grey), message: "%{value} is not a valid color" }
  validates :sex, inclusion: { in: %w(M F), message: "%{value} is not a valid option" }

  has_many :cat_rental_requests, dependent: :destroy

  def age
    (Date.today - self.birth_date).to_i / 365
  end

end
