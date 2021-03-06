class SalesController < ApplicationController
  before_action :set_sale, only: %i[ show edit update destroy ]

  # GET /sales or /sales.json
  def index
    respond_to do |format|
      format.html 
      format.json { render json: SaleDatatable.new(params) }
    end 
  end

  # GET /sales/1 or /sales/1.json
  def show
    respond_to do |format|
        format.html
        format.pdf do
            render pdf: "Invoice No. ",
            page_size: 'A4',
            template: "sales/pdf.html.erb",
            layout: "pdf.html.erb",
            orientation: "Landscape",
            lowquality: true,
            zoom: 1,
            dpi: 75
        end
    end
end

  # GET /sales/new
  def new
    @sale = Sale.new
    @parts = Part.all
  end

  # GET /sales/1/edit
  def edit
    @edit = true
    @parts = Part.all
  end

  # POST /sales or /sales.json
  def create
    @sale = Sale.new(sale_params)
    @user = current_user
    @sale.user_id = @user.id 
    respond_to do |format|
      if @sale.save
        format.html { redirect_to sale_url(@sale), notice: "Sale was successfully created." }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1 or /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to sale_url(@sale), notice: "Sale was successfully updated." }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1 or /sales/1.json
  def destroy
    @sale.destroy

    respond_to do |format|
      format.html { redirect_to sales_url, notice: "Orçamento deletado." }
      format.json { head :no_content }
    end
  end

  def finish_sale
        @sale = Sale.find(params[:id])
        @result = Sale.finish_sale(@sale)
        if @result 
          flash[:notice] = "Orçamento aprovado e encerrado com sucesso!"
        else 
          flash[:notice] = "Falha na aprovação e encerramento, tente novamente."
        end
        redirect_to sale_path(@sale)
  end
  
  def cancel_sale
        @sale = Sale.find(params[:id])
        @result = @sale.cancel_sale
        if @result 
          flash[:notice] = "Orçamento cancelado e encerrado com sucesso!"
        else 
          flash[:notice] = "Falha no cancelamento e encerramento, tente novamente."
        end
        redirect_to sale_path(@sale)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sale_params
      params.require(:sale).permit(:start_date, :end_date, :name, :description, :value, :comission_value, :service_id, :client_id, :user_id, part_ids: [])
    end
end
