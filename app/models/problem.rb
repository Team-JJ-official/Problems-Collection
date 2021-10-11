class Problem < ApplicationRecord
  belongs_to :problem_type
  belongs_to :answer, foreign_key: :alternative_id
  has_many :alternatives
end
