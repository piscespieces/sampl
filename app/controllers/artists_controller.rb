class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update]

  def edit
  end

  def update
    respond_to do |format|
      if @artist.update(artist_params)
        format.html { redirect_to artist_path(@artist), notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @artist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    if @artist.nil?
      redirect_to sample_packs_path
    else
      @artist
    end
  end

  private

  def set_artist
    begin
      @artist = User.find(params[:id])
    rescue
      redirect_to sample_packs_path
    end
  end

  def artist_params
    params.require(:user).permit(:image, :name, :bio)
  end
end