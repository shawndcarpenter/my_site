class CreateEducationPoints < ActiveRecord::Migration[7.1]
  def change
    create_table :education_points do |t|
      t.string :text
      t.references :education, null: false, foreign_key: true

      t.timestamps
    end
  end
end
