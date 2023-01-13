class PropertyValuesController < ApplicationController
  before_action :set_property_value, only: %i[ show edit update destroy ]

  # GET /values or /values.json
  def index
    @property_values = PropertyValue.all
  end

  # GET /values/1 or /values/1.json
  def show
  end

  # GET /values/new
  def new
    @property_value = PropertyValue.new
  end

  # GET /values/1/edit
  def edit
  end

  # POST /values or /values.json
  def create
    @property_value = PropertyValue.new(property_value_params)

    respond_to do |format|
      if @property_value.save
        format.html { redirect_to property_value_url(@property_value), notice: "Property_value was successfully created." }
        format.json { render :show, status: :created, location: @property_value }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /values/1 or /values/1.json
  def update
    respond_to do |format|
      if @property_value.update(property_value_params)
        format.html { redirect_to property_value_url(@property_value), notice: "Value was successfully updated." }
        format.json { render :show, status: :ok, location: @property_value }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /values/1 or /values/1.json
  def destroy
    @property_value.destroy

    respond_to do |format|
      format.html { redirect_to property_value_url, notice: "Value was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_value
      @property_value = PropertyValue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_value_params
      params.require(:property_value).permit(:property_data, :property_id)
    end
end
