class ConfigsController < ApplicationController
  before_action :set_config, only: [:show, :edit, :update, :destroy, :generate]
  include ConfigGenerator

  # GET /configs
  # GET /configs.json
  def index
    @configs = Config.all
  end

  # GET /configs/1
  # GET /configs/1.json
  def show
  end

  # GET /configs/new
  def new
    @config = Config.new
    3.times do
      @config.interfaces.build
    end
  end

  # GET /configs/1/edit
  def edit
  end

  # POST /configs
  # POST /configs.json
  def create
    @config = Config.new(config_params)

    respond_to do |format|
      if @config.save
        format.html { redirect_to @config, notice: 'Config was successfully created.' }
        format.json { render :show, status: :created, location: @config }
      else
        format.html { render :new }
        format.json { render json: @config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /configs/1
  # PATCH/PUT /configs/1.json
  def update
    respond_to do |format|
      if @config.update(config_params)
        format.html { redirect_to @config, notice: 'Config was successfully updated.' }
        format.json { render :show, status: :ok, location: @config }
      else
        format.html { render :edit }
        format.json { render json: @config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /configs/1
  # DELETE /configs/1.json
  def destroy
    @config.destroy
    respond_to do |format|
      format.html { redirect_to configs_url, notice: 'Config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GENERATE /configs/1/generate
  def generate
    send_data generate_rsc(@config), :filename => 'test.rsc'
    # redirect_to @config, notice: 'Config generated'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_config
      @config = Config.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def config_params
      params.require(:config).permit(:config_template_id, :system_name, :password, :snmp_community, :snmp_address, :snmp_contact, :snmp_location, interfaces_attributes: [:id, :name, :config_id, :interface_type, :ip, :subnet, :gateway, :username, :password])
    end
end
