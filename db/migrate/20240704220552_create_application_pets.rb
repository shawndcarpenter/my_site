class CreateApplicationPets < ActiveRecord::Migration[7.1]
  def change
    create_table :application_pets do |t|
      t.references :application, null: false, foreign_key: true
      t.references :pet, null: false, foreign_key: true
      t.integer :application_pet_status, default: 1
      t.string :name
      t.boolean :adoptable

      t.timestamps
    end
  end
end
