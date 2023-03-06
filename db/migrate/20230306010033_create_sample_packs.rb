class CreateSamplePacks < ActiveRecord::Migration[7.0]
  def change
    create_table :sample_packs do |t|
      t.references :artist, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
