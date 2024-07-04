class CreateExperiences < ActiveRecord::Migration[7.1]
  def change
    create_table :experiences do |t|
      t.string :title
      t.string :location
      t.string :time
      t.string :company
      
      t.timestamps
    end
  end
end
