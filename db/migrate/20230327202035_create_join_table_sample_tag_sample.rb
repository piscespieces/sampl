class CreateJoinTableSampleTagSample < ActiveRecord::Migration[7.0]
  def change
    create_join_table :sample_tags, :samples do |t|
      # t.index [:sample_tag_id, :sample_id]
      # t.index [:sample_id, :sample_tag_id]
    end
  end
end
