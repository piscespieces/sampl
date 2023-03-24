class SamplePacksController < ApplicationController
  before_action :set_sample_pack, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:index]
  before_action :all_sample_tag_names, only: [:update]

  # GET /sample_packs or /sample_packs.json
  def index
    @sample_packs = SamplePack.all
  end

  # GET /sample_packs/1 or /sample_packs/1.json
  def show
  end

  # GET /sample_packs/new
  def new
    @sample_pack = SamplePack.new
    # @sample_pack.samples.build
    # authorize @sample_pack
  end

  # GET /sample_packs/1/edit
  def edit
    authorize @sample_pack
  end

  # POST /sample_packs or /sample_packs.json
  def create
    @sample_pack = SamplePack.new(sample_pack_params)

    params[:sample_pack][:sample_pack_genre_names].each do |genre_name|
      @sample_pack.genre_list.add(genre_name)
    end

    @samples = params[:samples]&.map do |file|
      sample = @sample_pack.samples.new({ name: file.original_filename, audio: file })
      tag_list = params[:sample_tags][sample.name] if params[:sample_tags].present?
      sample.tag_list.add(tag_list) if tag_list.present?
      sample
    end
    
    respond_to do |format|
      if @sample_pack.save
        format.html { redirect_to sample_pack_url(@sample_pack), notice: "Sample pack was successfully created." }
        format.json { render :show, status: :created, location: @sample_pack }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sample_pack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sample_packs/1 or /sample_packs/1.json
  def update
    # For new samples added to the SamplePack
    @samples = params[:samples]&.map do |file|
      sample = @sample_pack.samples.new({ name: file.original_filename, audio: file })
      tag_list = params[:sample_tags][sample.name] if params[:sample_tags].present?
      sample.tag_list.add(tag_list) if tag_list.present?
      sample
    end

    # Handles the SamplePack genre tags
    if @sample_pack.genre_list != params[:sample_pack][:sample_pack_genre_names]
      @sample_pack.genre_list.remove(@sample_pack.genre_list)
      @sample_pack.genre_list.add(params[:sample_pack][:sample_pack_genre_names])
    end

    # Handles existing Sample tags
    @sample_pack.samples.each do |sample|
      break if !params[:sample_tags].present?
      next if !params[:sample_tags][sample.name].present?
      sample.tag_list.add(params[:sample_tags][sample.name])
      missing_tags = all_sample_tag_names - params[:sample_tags][sample.name]
      sample.tag_list.remove(missing_tags)
      sample.save
    end

    respond_to do |format|
      if @sample_pack.update(sample_pack_params)
        format.html { redirect_to sample_pack_url(@sample_pack), notice: "Sample pack was successfully updated." }
        format.json { render :show, status: :ok, location: @sample_pack }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sample_pack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sample_packs/1 or /sample_packs/1.json
  def destroy
    authorize @sample_pack
    @sample_pack.destroy

    respond_to do |format|
      format.html { redirect_to sample_packs_url, notice: "Sample pack was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def download
    # TODO: download sample pack zip file
  end

  def status
    job_id = session[:job_id]
    status = Sidekiq::Status::get_all(job_id)
    render json: { progress: status }
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_sample_pack
    @sample_pack = SamplePack.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def sample_pack_params
    params.require(:sample_pack).permit(:user_id, :name, :image, samples_attributes: [:id, :_destroy, audio: []])
  end

  def sample_tag_params
    params.require(:sample_tags).permit!
  end

  def all_sample_tag_names
    sample_tags = SampleTag.all.map(&:name)
  end

  def add_samples_with(tag_list)
    @samples.each do |sample_params|
      sample = Sample.new(sample_params)
      sample.tag_list.add(tag_list[sample_params[:name]]) if tag_list && tag_list[sample_params[:name]]
      @sample_pack.samples.push(sample)
    end
  end
end
