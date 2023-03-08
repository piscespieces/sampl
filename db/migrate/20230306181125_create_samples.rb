class CreateSamples < ActiveRecord::Migration[7.0]
  def change
    create_table :samples do |t|
      t.references :sample_pack, null: false, foreign_key: true
      t.string :name
      t.string :key
      t.integer :bpm

      t.timestamps
    end
  end
end
