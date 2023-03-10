class SamplesController < ApplicationController
  before_action :set_sample, only: %i[ show edit update destroy ]

  # GET /samples or /samples.json
  def index
    @samples = Sample.all
  end

  # GET /samples/1 or /samples/1.json
  def show
  end

  # GET /samples/new
  def new
    @sample = Sample.new
    authorize @sample
  end

  # GET /samples/1/edit
  def edit
    authorize @sample
  end

  # POST /samples or /samples.json
  def create
    @sample = Sample.new(sample_params)
    authorize @sample

    respond_to do |format|
      if @sample.save
        format.html { redirect_to sample_url(@sample), notice: "Sample was successfully created." }
        format.json { render :show, status: :created, location: @sample }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /samples/1 or /samples/1.json
  def update
    authorize @sample
    respond_to do |format|
      if @sample.update(sample_params)
        format.html { redirect_to sample_url(@sample), notice: "Sample was successfully updated." }
        format.json { render :show, status: :ok, location: @sample }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /samples/1 or /samples/1.json
  def destroy
    authorize @sample
    @sample.destroy

    respond_to do |format|
      format.html { redirect_to samples_url, notice: "Sample was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def like
    @sample = Sample.find(params[:sample_id])
    @already_liked = @sample.already_liked?(current_user.id)

    if @already_liked
      @sample.likes.find_by!(user_id: current_user.id).destroy
      respond_to redirect_to sample_pack_path(@sample.sample_pack)
    else
      @sample.likes.create!(user_id: current_user.id)
      redirect_to sample_pack_path(@sample.sample_pack)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sample
      @sample = Sample.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sample_params
      params.require(:sample).permit(:sample_pack_id, :name, :key, :bpm, :audio)
    end
end
