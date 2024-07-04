class CreateSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :skills do |t|
      t.string :text

      t.timestamps
    end
  end
end
