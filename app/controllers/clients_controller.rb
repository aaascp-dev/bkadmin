class ClientsController < AdminController
  def index
    @clients = Client.search(params[:search])
  end

  def new
    @client = Client.new
    @address = Address.new
  end

  def show
    @client = Client.find(params[:id])
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      flash[:success] = "Salvo com sucesso."
      redirect_to clients_path
    else
      render :new
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update_attributes(client_params)
      flash[:success] = "Atualizado com sucesso."
      redirect_to clients_path
    else
      render :edit
    end
  end

  def destroy
    if Client.find(params[:id]).destroy
      flash[:success] = "Exlcuído com sucesso."
    else
      flash[:error] = "Falha ao excluir. Tente novamente."
    end
    redirect_to beers_path
  end

  private
    def client_params
      params.require(:client).permit(
        :full_name,
        :document_number,
        :email,
        :phone,
        :birthdate,
        :address: [:zip_code, :street, :number, :complement, :neighborhood, :city, :state, :country])
    end
end
