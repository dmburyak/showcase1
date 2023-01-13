class PropertyGroupsController < ApplicationController
  before_action :set_property_group, only: %i[ show edit update destroy ]

  # GET /property_groups or /property_groups.json
  def index
    @property_groups = PropertyGroup.all
  end

  # GET /property_groups/1 or /property_groups/1.json
  def show
  end

  # GET /property_groups/new
  def new
    @property_group = PropertyGroup.new
  end

  # GET /property_groups/1/edit
  def edit
  end

  # POST /property_groups or /property_groups.json
  def create
    @property_group = PropertyGroup.new(property_group_params)

    respond_to do |format|
      if @property_group.save
        format.html { redirect_to property_group_url(@property_group), notice: "Property group was successfully created." }
        format.json { render :show, status: :created, location: @property_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /property_groups/1 or /property_groups/1.json
  def update
    respond_to do |format|
      if @property_group.update(property_group_params)
        format.html { redirect_to property_group_url(@property_group), notice: "Property group was successfully updated." }
        format.json { render :show, status: :ok, location: @property_group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /property_groups/1 or /property_groups/1.json
  def destroy
    @property_group.destroy

    respond_to do |format|
      format.html { redirect_to property_groups_url, notice: "Property group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_group
      @property_group = PropertyGroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_group_params
      params.require(:property_group).permit(:name, :main, :order)
    end
end
