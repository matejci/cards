# frozen_string_literal: true

class GradedCard < ApplicationRecord
  belongs_to :card, dependent: :destroy

  GRADE_STEPS = (1..10).step(0.5).to_a
  GRADES = GRADE_STEPS.map(&:to_s) + ['10 black', '10 gold']
  QUALIFIER_VALUES = ['OC', 'OD', 'OB', 'MB', 'CB'].freeze

  validates :name, presence: true
  validates :grade, inclusion: { in: GRADES, allow_blank: true }
  validates :qualifier, inclusion: { in: QUALIFIER_VALUES, allow_blank: true }
  validates :card_id, uniqueness: { scope: [:grade, :qualifier] }

  def graded?
    grade.present?
  end
end
