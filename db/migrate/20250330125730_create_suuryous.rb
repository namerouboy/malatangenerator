class CreateSuuryous < ActiveRecord::Migration[7.1]
  def change
    create_table :suuryous do |t|
      t.integer :suuryou

      t.timestamps
    end
  end
end
