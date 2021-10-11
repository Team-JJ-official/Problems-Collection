class CreateProblems < ActiveRecord::Migration[6.1]
  def change
    create_table :problems do |t|
      t.text :sentence
      t.text :explanation
      t.string :genre
      t.references :alternative, foreign_key: true
      t.references :problem_type, foreign_key: true

      t.timestamps
    end
  end
end
