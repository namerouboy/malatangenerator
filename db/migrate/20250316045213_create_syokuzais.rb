class CreateSyokuzais < ActiveRecord::Migration[7.1]
  def change
    create_table :syokuzais do |t|
      t.string :category
      t.string :name
      t.integer :weight
      t.integer :calorie
      t.text :explanation

      t.timestamps
    end
  end
end
