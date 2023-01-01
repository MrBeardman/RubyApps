class Settings::TagsController < ApplicationController
  before_action :set_settings_tag, only: [:show, :edit, :update, :destroy]
  # GET /settings/tags
  # GET /settings/tags.json
  def index
    @settings_tags = Settings::Tag.all
  end

  # GET /settings/tags/1
  # GET /settings/tags/1.json
  def show
  end

  # GET /settings/tags/new
  def new
    @settings_tag = Settings::Tag.new
  end

  # GET /settings/tags/1/edit
  def edit
  end

  # POST /settings/tags
  # POST /settings/tags.json
  def create
    @settings_tag = Settings::Tag.new(settings_tag_params)
  @settings_tag.user = current_user
    respond_to do |format|
      if @settings_tag.save
        format.html { redirect_to @settings_tag, notice: 'Tag was successfully created.' }
        format.json { render :show, status: :created, location: @settings_tag }
      else
        format.html { render :new }
        format.json { render json: @settings_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /settings/tags/1
  # PATCH/PUT /settings/tags/1.json
  def update
    respond_to do |format|
      if @settings_tag.update(settings_tag_params)
        format.html { redirect_to @settings_tag, notice: 'Tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @settings_tag }
      else
        format.html { render :edit }
        format.json { render json: @settings_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /settings/tags/1
  # DELETE /settings/tags/1.json
  def destroy
    @settings_tag.destroy
    respond_to do |format|
      format.html { redirect_to settings_tags_url, notice: 'Tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_settings_tag
    @settings_tag = Settings::Tag.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def settings_tag_params
    params.require(:settings_tag).permit(:title, :color)
  end
end