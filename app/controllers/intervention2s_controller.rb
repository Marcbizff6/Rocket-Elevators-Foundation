class Intervention2sController < ApplicationController
  before_action :set_intervention2, only: [:show, :edit, :update, :destroy]

  # GET /intervention2s
  # GET /intervention2s.json
  def index
    @intervention2s = Intervention2.all
  end

  # GET /intervention2s/1
  # GET /intervention2s/1.json
  def show
  end

  # GET /intervention2s/new
  def new
    @intervention2 = Intervention2.new
  end

  # GET /intervention2s/1/edit
  def edit
  end

  # POST /intervention2s
  # POST /intervention2s.json
  def create
    @intervention2 = Intervention2.new(intervention2_params)

    respond_to do |format|
      if @intervention2.save
        format.html { redirect_to @intervention2, notice: 'Intervention2 was successfully created.' }
        format.json { render :show, status: :created, location: @intervention2 }
      else
        format.html { render :new }
        format.json { render json: @intervention2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intervention2s/1
  # PATCH/PUT /intervention2s/1.json
  def update
    respond_to do |format|
      if @intervention2.update(intervention2_params)
        format.html { redirect_to @intervention2, notice: 'Intervention2 was successfully updated.' }
        format.json { render :show, status: :ok, location: @intervention2 }
      else
        format.html { render :edit }
        format.json { render json: @intervention2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intervention2s/1
  # DELETE /intervention2s/1.json
  def destroy
    @intervention2.destroy
    respond_to do |format|
      format.html { redirect_to intervention2s_url, notice: 'Intervention2 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention2
      @intervention2 = Intervention2.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention2_params
      params.require(:intervention2).permit(:column_id)
    end
end
