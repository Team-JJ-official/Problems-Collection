class Problem < ApplicationRecord
  belongs_to :problem_type, optional: true
  belongs_to :answer, class_name: "Alternative", foreign_key: "alternative_id", optional: true
  has_many :alternatives
end
