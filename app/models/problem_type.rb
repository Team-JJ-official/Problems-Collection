class ProblemType < ApplicationRecord
  has_many :problems, dependent: :destroy
end
