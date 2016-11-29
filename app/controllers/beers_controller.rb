class BeersController < AdminController
  def index
    #@beers = Beers.order("LOWER(name)").all
    @beers = Beer.search(params[:search])
  end

  def new
    @beer = Beer.new
    @styles = BeerType.order("LOWER(name)").all
    @providers = Provider.order("LOWER(name)").all
    @packages = Package.order("LOWER(name)").all
    @beer_characteristics = BeerCharacteristic.order("LOWER(name)").all
  end

  def create
    @beer = Beer.new(beer_params)
    if @beer.save
      flash[:success] = "Salvo com sucesso."
      save_beer_characteristics(@beer.id, params[:beer_characteristics])
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
  end

  def update
    @beer = Beer.find(params[:id])
    if @beer.update_attributes(package_params)
      flash[:success] = "Atualizado com sucesso."
      redirect_to beers_path
    else
      render :edit
    end
  end

  def destroy
    Beer.find(params[:id]).destroy
    redirect_to beers_path
  end

  private
    def save_beer_characteristics(beer_id,characteristics)
      for characteristic in characteristics do
        attributes = {}
        attributes[:beer_id] = beer_id
        attributes[:beer_characteristic_id] = characteristic
        beer_characteristic = BeersBeerCharacteristic.new(attributes)
        unless beer_characteristic.save
          flash[:error] = "Erro ao salvar as características da cerveja, clique em editar para adicionar novamente."
        end
      end
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
