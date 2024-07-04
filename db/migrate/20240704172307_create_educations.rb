class CreateEducations < ActiveRecord::Migration[7.1]
  def change
    create_table :educations do |t|
      t.string :name
      t.string :degree
      t.string :years
      t.string :location

      t.timestamps
    end
  end
end
