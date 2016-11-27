class BeerCharacteristicsController < AdminController
  def index
    @beer_characteristic = BeerCharacteristic.new
    @types = BeerCharacteristic.order("LOWER(name)").all
  end

  def create
    @beer_characteristic = BeerCharacteristic.new(beer_characteristic_params)
    if @beer_characteristic.save
      flash[:success] = "Salvo com sucesso"
      redirect_to beer_characteristics_path
    else
      @types = BeerCharacteristic.order("LOWER(name)").all
      render :index
    end
  end

  def edit
    @beer_characteristic = BeerCharacteristic.find(params[:id])
    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  def update
    @beer_characteristic = BeerCharacteristic.find(params[:id])
    if @beer_characteristic.update_attributes(beer_characteristic_params)
      flash[:success] = "Atualizado com sucesso"
      redirect_to beer_characteristics_path
    else
      @types = BeerCharacteristic.order("LOWER(name)").all
      render :index
    end
  end

  def destroy
    BeerCharacteristic.find(params[:id]).destroy
    redirect_to beer_characteristics_path
  end

  private

    def beer_characteristic_params
      params.require(:beer_characteristic).permit(:name)
    end
end
