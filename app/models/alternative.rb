class Alternative < ApplicationRecord
  belongs_to :problem, foreign_key: "problem_id"
  has_one :answer, class_name: "Problem"
end
