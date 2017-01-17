class ConfigTemplatesController < ApplicationController
  before_action :set_config_template, only: [:show, :edit, :update, :destroy]

  # GET /config_templates
  # GET /config_templates.json
  def index
    @config_templates = ConfigTemplate.all
  end

  # GET /config_templates/1
  # GET /config_templates/1.json
  def show
  end

  # GET /config_templates/new
  def new
    @config_template = ConfigTemplate.new
  end

  # GET /config_templates/1/edit
  def edit
  end

  # POST /config_templates
  # POST /config_templates.json
  def create
    @config_template = ConfigTemplate.new(config_template_params)

    respond_to do |format|
      if @config_template.save
        format.html { redirect_to @config_template, notice: 'Config template was successfully created.' }
        format.json { render :show, status: :created, location: @config_template }
      else
        format.html { render :new }
        format.json { render json: @config_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /config_templates/1
  # PATCH/PUT /config_templates/1.json
  def update
    respond_to do |format|
      if @config_template.update(config_template_params)
        format.html { redirect_to @config_template, notice: 'Config template was successfully updated.' }
        format.json { render :show, status: :ok, location: @config_template }
      else
        format.html { render :edit }
        format.json { render json: @config_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /config_templates/1
  # DELETE /config_templates/1.json
  def destroy
    @config_template.destroy
    respond_to do |format|
      format.html { redirect_to config_templates_url, notice: 'Config template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_config_template
      @config_template = ConfigTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def config_template_params
      params.require(:config_template).permit(:name, :description, :config_text)
    end
end
