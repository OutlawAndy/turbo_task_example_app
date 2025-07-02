class Task < ApplicationRecord
  validates :name, presence: true

  scope :todo, -> { where(done_at: nil) }
  scope :overdue, -> { todo.where(due_at: (..Time.current)) }
  scope :done, -> { where.not(done_at: nil) }

  def done=(form_value)
    self.done_at = ActiveRecord::Type::Boolean.new.cast(form_value) ? Time.current : nil
  end

  def done = done_at.present?
  alias done? done
end
