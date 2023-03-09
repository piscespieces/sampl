class Artists::SamplePacksController < ApplicationController
  before_action :set_sample_pack, only: %i[ show edit update destroy ]
  before_action :authenticate_artist!

  # GET artists/sample_packs
  def index
    @sample_packs = SamplePack.where(artist_id: current_artist.id)
  end

  # GET artists/sample_packs/1
  def show
  end

  # GET artists/sample_packs/new
  def new
    @sample_pack = SamplePack.new
  end

  # GET artists/sample_packs/1/edit
  def edit
    authorize [:artist, @sample_pack]
  end

  # POST /sample_packs or /sample_packs.json
  def create
    samples_attributes = sample_params.inject({}) do |hash, file|
      name = file.original_filename.delete(".mp3")
      hash.merge!(SecureRandom.hex => { audio: file, name: name })
    end
    sample_pack_attributes  = sample_pack_params.merge(samples_attributes: samples_attributes)    
    @sample_pack = SamplePack.new(sample_pack_attributes)

    respond_to do |format|
      if @sample_pack.save
        format.html { redirect_to artists_sample_pack_url(@sample_pack), notice: "Sample pack was successfully created." }
        format.json { render :show, status: :created, location: @sample_pack }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sample_pack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT artists/sample_pack/1
  def update
    respond_to do |format|
      if @sample_pack.update(sample_pack_params)
        format.html { redirect_to artists_sample_pack_url(@sample_pack), notice: "Sample pack was successfully updated." }
        format.json { render :show, status: :ok, location: @sample_pack }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sample_pack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE artists/sample_packs/1
  def destroy
    @sample_pack.destroy

    respond_to do |format|
      format.html { redirect_to sample_packs_url, notice: "Sample pack was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sample_pack
    @sample_pack = SamplePack.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def sample_pack_params
    params.require(:sample_pack).permit(:artist_id, :name, :image)
  end

  def sample_params
    params.require(:samples)
  end

  def pundit_user
    current_artist
  end
end