class CreateViewerParties < ActiveRecord::Migration[7.1]
  def change
    create_table :viewer_parties do |t|
      t.references :viewer, null: false, foreign_key: true
      t.references :party, null: false, foreign_key: true

      t.timestamps
    end
  end
end
