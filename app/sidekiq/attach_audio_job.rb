class AttachAudioJob
  include Sidekiq::Worker
  include Sidekiq::Status::Worker
  queue_as :default

  def perform(sample_pack_id, samples_json, tag_list = nil)
    total 100
    at 10, "Loading..."

    if tag_list
      @parsed_tag_hash = JSON.parse(tag_list)
      @parsed_tag_list = @parsed_tag_hash.transform_values { |tags| tags.keys }.to_h
    end

    at 30, "Loading..."


    parsed_samples = JSON.parse(samples_json)
    sample_pack = SamplePack.find(sample_pack_id)

    at 50, "Loading..."

    parsed_samples.each do |sample_params|
      sample = sample_pack.samples.create({ name: sample_params["name"] })
      sample.tag_list.add(@parsed_tag_list[sample_params["name"]]) if @parsed_tag_list && @parsed_tag_list[sample_params["name"]]
      sample.audio.attach(
        io: StringIO.new(Base64.decode64(sample_params["audio"])),
        filename: sample_params["name"],
        content_type: "audio/mpeg"
      )
      at 60, "Loading.."
    end

    at 100, "Sample Pack Fully Uploaded"
  end
end
