class CreateMalatanSyokuzais < ActiveRecord::Migration[6.1]
  def change
    create_table :malatan_syokuzais do |t|
      t.references :malatan, null: false, foreign_key: true
      t.references :syokuzai, null: false, foreign_key: true
      t.integer :count, null: false, default: 1

      t.timestamps
    end
  end
end