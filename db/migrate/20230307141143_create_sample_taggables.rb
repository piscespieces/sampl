class CreateSampleTaggables < ActiveRecord::Migration[7.0]
  def change
    create_table :sample_taggables do |t|
      t.references :sample, null: false, foreign_key: true
      t.references :sample_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
