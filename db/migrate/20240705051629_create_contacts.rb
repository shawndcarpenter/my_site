class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :subject
      t.text :description
      
      t.timestamps
    end
  end
end
