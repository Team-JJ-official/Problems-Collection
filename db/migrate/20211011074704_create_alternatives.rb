class CreateAlternatives < ActiveRecord::Migration[6.1]
  def change
    create_table :alternatives do |t|
      t.string :sentence
      t.references :problem, foreign_key: true
      
      t.timestamps
    end
  end
end
