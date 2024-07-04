class CreateExperiencePoints < ActiveRecord::Migration[7.1]
  def change
    create_table :experience_points do |t|
      t.string :text
      t.references :experience, null: false, foreign_key: true

      t.timestamps
    end
  end
end
