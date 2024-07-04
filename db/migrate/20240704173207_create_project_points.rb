class CreateProjectPoints < ActiveRecord::Migration[7.1]
  def change
    create_table :project_points do |t|
      t.string :text
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
