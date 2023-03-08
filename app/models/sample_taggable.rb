class SampleTaggable < ApplicationRecord
  belongs_to :sample
  belongs_to :sample_tag
end
