class Task < ApplicationRecord
  validates :name, presence: true

  scope :todo, -> { where(done_at: nil) }
  scope :done, -> { !todo }

  def done=(form_value)
    self.done_at = ActiveRecord::Type::Boolean.new.cast(form_value) ? Time.current : nil
  end

  def done = done_at.present?
  alias done? done
end
