class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :github
      t.string :description
      t.string :time
      t.integer :collaborators
      
      t.timestamps
    end
  end
end
