class MegalithsController < ApplicationController
  before_action :set_megalith, only: %i[ show edit update destroy ]

  # GET /megaliths or /megaliths.json
  def index
    @megaliths = Megalith.all

     # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @megaliths.geocoded.map do |megalith|
      {
        lat: megalith.latitude,
        lng: megalith.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { megalith: megalith }),
        image_url: helpers.asset_url('https://res.cloudinary.com/dc9pm7uj8/image/upload/v1587038185/menhirs_zuyjob.png')
      }
    end
  end

  # GET /megaliths/1 or /megaliths/1.json
  def show
    #  @markers = @megaliths.map do |megalith|
    #   if megalith.category == "Menhir"
    #   icon = 'https://res.cloudinary.com/dc9pm7uj8/image/upload/v1587038185/menhirs_zuyjob.png'
    #   elsif megalith.category == "Cairn"
    #     icon = 'https://res.cloudinary.com/dc9pm7uj8/image/upload/v1587038186/cairn_zngsdy.png'
    #   elsif megalith.category == "Dolmen"
    #     icon = 'https://res.cloudinary.com/dc9pm7uj8/image/upload/v1587038186/dolmen_pklsdz.png'
    #   elsif megalith.category == "Tumulus"
    #     icon = 'https://res.cloudinary.com/dc9pm7uj8/image/upload/v1587038186/cairn_zngsdy.png'
    #   elsif megalith.category == "Alignement Menhir"
    #     icon = 'https://res.cloudinary.com/dc9pm7uj8/image/upload/v1587038186/alignement_fe1kme.png'
    #   else
    #     icon = 'https://res.cloudinary.com/dc9pm7uj8/image/upload/v1587038186/alignement_fe1kme.png'
    #   end
    #   {
    #     lat: megalith.latitude,
    #     lng: megalith.longitude,
    #     image_url: helpers.asset_url(icon)
    #   }
    # end
  end

  # GET /megaliths/new
  def new
    @megalith = Megalith.new
  end

  # GET /megaliths/1/edit
  def edit
  end

  # POST /megaliths or /megaliths.json
  def create
    @megalith = Megalith.new(megalith_params)

    respond_to do |format|
      if @megalith.save
        format.html { redirect_to @megalith, notice: "Megalith was successfully created." }
        format.json { render :show, status: :created, location: @megalith }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @megalith.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /megaliths/1 or /megaliths/1.json
  def update
    respond_to do |format|
      if @megalith.update(megalith_params)
        format.html { redirect_to @megalith, notice: "Megalith was successfully updated." }
        format.json { render :show, status: :ok, location: @megalith }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @megalith.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /megaliths/1 or /megaliths/1.json
  def destroy
    @megalith.destroy
    respond_to do |format|
      format.html { redirect_to megaliths_url, notice: "Megalith was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_megalith
      @megalith = Megalith.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def megalith_params
      params.require(:megalith).permit(:name, :address, :category)
    end
end
