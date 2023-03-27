class CreateJoinTableGenreSamplePack < ActiveRecord::Migration[7.0]
  def change
    create_join_table :genres, :sample_packs do |t|
      # t.index [:genre_id, :sample_pack_id]
      # t.index [:sample_pack_id, :genre_id]
    end
  end
end
