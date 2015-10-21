class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validate :approved_requests_cannot_conflict
  validate :time_must_move_forward

  belongs_to :cat
  belongs_to :requester,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id


  def overlapping_requests
    requests = CatRentalRequest.where(cat_id: self.cat_id, id: !self.id)
      .where("start_date < ? AND end_date > ?", self.end_date, self.start_date)
      # :start_date < self.end_date, :end_date > self.start_date)
    overlaps = []

    requests.each do |request|
      overlaps << request if self.end_date > request.start_date && self.start_date < request.end_date
    end

    overlaps
  end

  def overlapping_approved_requests
    overlapping_requests.select { |overlap| overlap.status == 'APPROVED'}
  end

  def approved_requests_cannot_conflict
    unless overlapping_approved_requests.empty?
      errors.add(:request_conflict, "Cat already rented during this request.")
    end
  end

  def time_must_move_forward
    if start_date < Time.now || end_date < start_date
      errors.add(:date_conflict, "Dates must be in the future.")
    end
  end

end
