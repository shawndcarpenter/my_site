class Party < ApplicationRecord
  has_many :viewer_parties
  has_many :viewers, through: :viewer_parties

  def pretty_day
    day.strftime("%B %e, %Y")
  end

  def pretty_time
    start_time.strftime("%l:%M %p")
  end

  def duration_in_hours_and_minutes
    "#{duration/60}h #{duration % 60}min"
  end
end