class SamplePacksController < ApplicationController
  before_action :set_sample_pack, only: %i[ show edit update destroy ]
  before_action :set_sample_pack, only: %i[ show edit update destroy ]
  before_action :authenticate_all, only: [:index]

  # def policy_scope(scope)
  #   super([:admin, scope])
  # end

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
    authorize @sample_pack
  end

  # GET /sample_packs/1/edit
  def edit
    authorize @sample_pack
  end

  # POST /sample_packs or /sample_packs.json
  def create
    samples_attributes = sample_params.inject({}) do |hash, file|
      name = file.original_filename.delete(".mp3")
      hash.merge!(SecureRandom.hex => { audio: file, name: name })
    end
    sample_pack_attributes  = sample_pack_params.merge(samples_attributes: samples_attributes)    
    @sample_pack = SamplePack.new(sample_pack_attributes)
    authorize @sample_pack

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
    authorize @sample_pack
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

    def authenticate_all
      if !user_signed_in? && !artist_signed_in?
        redirect_to new_user_session_path
      end
    end

    def pundit_user
      current_artist
    end
end
