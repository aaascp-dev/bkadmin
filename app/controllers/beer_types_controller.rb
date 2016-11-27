class BeerTypesController < AdminController
  def index
    @beer_type = BeerType.new
    @types = BeerType.order("LOWER(name)").all
  end

  def create
    @beer_type = BeerType.new(beer_type_params)
    if @beer_type.save
      flash[:success] = "Salvo com sucesso"
      redirect_to beer_types_path
    else
      @types = BeerType.order("LOWER(name)").all
      render :index
    end
  end

  def edit
    @beer_type = BeerType.find(params[:id])
    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  def update
    @beer_type = BeerType.find(params[:id])
    if @beer_type.update_attributes(beer_type_params)
      flash[:success] = "Atualizado com sucesso"
      redirect_to beer_types_path
    else
      @types = BeerType.order("LOWER(name)").all
      render :index
    end
  end

  def destroy
    BeerType.find(params[:id]).destroy
    redirect_to beer_types_path
  end

  private

    def beer_type_params
      params.require(:beer_type).permit(:name)
    end
end
