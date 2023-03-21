class CreateSamplePackGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :sample_pack_genres do |t|
      t.string :name

      t.timestamps
    end
  end
end
