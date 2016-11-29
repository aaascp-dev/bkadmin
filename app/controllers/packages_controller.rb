class PackagesController < ApplicationController
  def index
    @package = Package.new
    @packages = Package.order("LOWER(name)").all
  end

  def create
    @package = Package.new(package_params)
    if @package.save
      flash[:success] = "Salvo com sucesso"
      redirect_to packages_path
    else
      @packages = Package.order("LOWER(name)").all
      render :index
    end
  end

  def edit
    @package = Package.find(params[:id])
    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  def update
    @package = Package.find(params[:id])
    if @package.update_attributes(package_params)
      flash[:success] = "Atualizado com sucesso"
      redirect_to packages_path
    else
      @packages = Package.order("LOWER(name)").all
      render :index
    end
  end

  def destroy
    Package.find(params[:id]).destroy
    redirect_to packages_path
  end

  private

    def package_params
      params.require(:package).permit(:name)
    end
end
