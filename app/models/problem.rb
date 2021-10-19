class Problem < ApplicationRecord
  belongs_to :problem_type
  belongs_to :answer, class_name: "Alternative", foreign_key: "alternative_id", optional: true
  has_many :alternatives, dependent: :destroy

  validates :sentence,  {
    presence: true
  }

  validates :explanation,  {
    presence: true
  }

  validates :genre,  {
    presence: true
  }

end
