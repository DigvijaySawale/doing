class Task < ApplicationRecord
  enum :priority, {
    low: 0,
    medium: 1,
    high: 2
  }

  enum :status, {
    pending: 0,
    in_progress: 1,
    completed: 2,
    failed: 3
  }

  validates :title, presence: true
  validates :scheduled_date, presence: true

  before_validation :set_defaults
  before_save :calculate_duration
  before_save :set_completed_at

  scope :today, -> {
    where(scheduled_date: Date.current)
  }

  scope :upcoming, -> {
    where("scheduled_date > ?", Date.current)
  }

  scope :overdue, -> {
    where("due_date < ?", Date.current)
      .where.not(status: :completed)
  }

  scope :completed_today, -> {
    where(completed_at: Date.current.all_day)
  }

  scope :pending, -> {
    where(scheduled_date: Date.current).where.not(status: :completed)
  }
  

  private

  def set_defaults
    self.scheduled_date ||= Date.current
    # self.due_date ||= Date.current
  end

  def calculate_duration
    return unless start_time.present? && end_time.present?

    self.duration_minutes =
      ((end_time - start_time) / 60).to_i
  end

  def set_completed_at
    if completed? && completed_at.blank?
      self.completed_at = Time.current
    end
  end
end