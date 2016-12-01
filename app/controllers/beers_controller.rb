class BeersController < AdminController
  def index
    @beers = Beer.search(params[:search])
  end

  def new
    @beer = Beer.new
    @styles = BeerType.order("LOWER(name)").all
    @providers = Provider.order("LOWER(name)").all
    @packages = Package.order("LOWER(name)").all
    @beer_characteristics = BeerCharacteristic.order("LOWER(name)").all
  end

  def show
    @beer = Beer.find(params[:id])
  end

  def create
    @beer = Beer.new(beer_params)
    if @beer.save
      flash[:success] = "Salvo com sucesso."
      save_beer_characteristics(@beer, params[:beer_characteristics])
      redirect_to beers_path
    else
      @styles = BeerType.order("LOWER(name)").all
      @providers = Provider.order("LOWER(name)").all
      @packages = Package.order("LOWER(name)").all
      @beer_characteristics = BeerCharacteristic.order("LOWER(name)").all
      render :new
    end
  end

  def edit
    @beer = Beer.find(params[:id])
    @styles = BeerType.order("LOWER(name)").all
    @providers = Provider.order("LOWER(name)").all
    @packages = Package.order("LOWER(name)").all
    @beer_characteristics = BeerCharacteristic.order("LOWER(name)").all
  end

  def update
    @beer = Beer.find(params[:id])
    if @beer.update_attributes(beer_params)
      flash[:success] = "Atualizado com sucesso."
      update_beer_characteristics(@beer, params[:beer_characteristics])
      redirect_to beers_path
    else
      @styles = BeerType.order("LOWER(name)").all
      @providers = Provider.order("LOWER(name)").all
      @packages = Package.order("LOWER(name)").all
      @beer_characteristics = BeerCharacteristic.order("LOWER(name)").all
      render :edit
    end
  end

  def destroy
    if Beer.find(params[:id]).destroy
      flash[:success] = "Exlcuído com sucesso."
    else
      flash[:error] = "Falha ao excluir. Tente novamente."
    end
    redirect_to beers_path
  end

  private
    def save_beer_characteristics(beer,characteristics)
      for characteristic in characteristics do
        beer_characteristic = BeerCharacteristic.find(characteristic)
        beer.beer_characteristics << beer_characteristic
      end
    end

    def update_beer_characteristics(beer,characteristics)
      beer_characteristics = []
      for characteristic in characteristics do
        beer_characteristic = BeerCharacteristic.find(characteristic)
        beer_characteristics << beer_characteristic
      end
      beer.beer_characteristics.replace(beer_characteristics)
    end

    def beer_params
      params.require(:beer).permit(
        :code,
        :beer_type_id,
        :is_imported,
        :is_better_quality,
        :batch_number,
        :expiration_date,
        :volume,
        :name,
        :price,
        :cost,
        :stock,
        :provider_id,
        :package_id)
    end
end
