class CreateProblemTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :problem_types do |t|
      t.string :name
      t.text :sentence

      t.timestamps
    end
  end
end
