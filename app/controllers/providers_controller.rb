class ProvidersController < AdminController
    def index
      @provider = Provider.new
      @providers = Provider.order("LOWER(name)").all
    end

    def create
      @provider = Provider.new(provider_params)
      if @provider.save
        flash[:success] = "Salvo com sucesso"
        redirect_to providers_path
      else
        @providers = Provider.order("LOWER(name)").all
        render :index
      end
    end

    def edit
      @provider = Provider.find(params[:id])
      respond_to do |format|
        format.html { render :layout => false }
      end
    end

    def update
      @provider = Provider.find(params[:id])
      if @provider.update_attributes(provider_params)
        flash[:success] = "Atualizado com sucesso"
        redirect_to providers_path
      else
        @providers = Provider.order("LOWER(name)").all
        render :index
      end
    end

    def destroy
      Provider.find(params[:id]).destroy
      redirect_to providers_path
    end

    private

      def provider_params
        params.require(:provider).permit(:name)
      end
end
