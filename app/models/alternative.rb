class Alternative < ApplicationRecord
  belongs_to :problem, foreign_key: "problem_id"
end
