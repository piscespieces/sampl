class SampleTagsController < ApplicationController
  before_action :set_sample_tag, only: %i[ show edit update destroy ]

  # GET /sample_tags or /sample_tags.json
  def index
    @sample_tags = SampleTag.all.map(&:name)

    respond_to do |format|
      format.json { render json: @sample_tags }
    end
  end

  # GET /sample_tags/1 or /sample_tags/1.json
  def show
  end

  # GET /sample_tags/new
  def new
    @sample_tag = SampleTag.new
  end

  # GET /sample_tags/1/edit
  def edit
  end

  # POST /sample_tags or /sample_tags.json
  def create
    @sample_tag = SampleTag.new(sample_tag_params)

    respond_to do |format|
      if @sample_tag.save
        format.html { redirect_to sample_tag_url(@sample_tag), notice: "Sample tag was successfully created." }
        format.json { render :show, status: :created, location: @sample_tag }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sample_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sample_tags/1 or /sample_tags/1.json
  def update
    respond_to do |format|
      if @sample_tag.update(sample_tag_params)
        format.html { redirect_to sample_tag_url(@sample_tag), notice: "Sample tag was successfully updated." }
        format.json { render :show, status: :ok, location: @sample_tag }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sample_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sample_tags/1 or /sample_tags/1.json
  def destroy
    @sample_tag.destroy

    respond_to do |format|
      format.html { redirect_to sample_tags_url, notice: "Sample tag was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sample_tag
      @sample_tag = SampleTag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sample_tag_params
      params.require(:sample_tag).permit(:title)
    end
end
