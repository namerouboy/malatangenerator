class Ingredient < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredirnt do |t|
      t.string :category
      t.string :name
      t.integer :weight
      t.integer :calorie
      t.string :explanation
      t.timestamps
    end
  end
end
