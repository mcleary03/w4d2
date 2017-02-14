# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  status     :string           default("PENDING"), not null
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#

class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :status, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED), message: "%{value} is not a valid option" }
  validate :overlapping_approved_requests

  belongs_to :cat

  def overlapping_requests
    rentals = CatRentalRequest.where(cat_id: self.cat_id)
    rentals.map do |rental|
      rental.start_date.between?(self.start_date, self.end_date) || rental.end_date.between?(self.start_date, self.end_date)
    end
  end

  def overlapping_approved_requests
    overlapping_requests.each do |request|
      if self.status == 'APPROVED' && request.status == 'APPROVED'
        self.errors[:status] << "overlapping requests"
      end
    end
  end
end
