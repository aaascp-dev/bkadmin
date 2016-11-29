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
  end

  def create
    @beer = Beers.new(beer_params)
    if @beer.save
      flash[:success] = "Salvo com sucesso."
      redirect_to beers_path
    end
  end

  def edit
    @beer = Beers.find(params[:id])
  end

  def update
    @beer = Beers.find(params[:id])
    if @beer.update_attributes(package_params)
      flash[:success] = "Atualizado com sucesso."
      redirect_to beers_path
    else
      render :edit
    end
  end

  def destroy
    Beers.find(params[:id]).destroy
    redirect_to beers_path
  end

  private
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
        :provider,
        :package)
    end
end
