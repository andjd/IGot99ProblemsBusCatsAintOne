class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.date :birthdate, presence: true 
      t.string :color, presence: true
      t.string :name, presence: true
      t.string :sex, limit: 1
      t.text :description

      t.timestamps
    end
  end
end
