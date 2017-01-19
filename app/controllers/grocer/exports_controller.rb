class Grocer::ExportsController < ApplicationController
  before_action :set_grocer_export, only: [:show, :edit, :update, :destroy]

  # GET /grocer/exports
  # GET /grocer/exports.json
  def index
    @grocer_exports = Grocer::Export.all
  end

  # GET /grocer/exports/1
  # GET /grocer/exports/1.json
  def show
  end

  # GET /grocer/exports/new
  def new
    @grocer_export = Grocer::Export.new
  end

  # GET /grocer/exports/1/edit
  def edit
  end

  # POST /grocer/exports
  # POST /grocer/exports.json
  def create
    @grocer_export = Grocer::Export.new(grocer_export_params)

    respond_to do |format|
      if @grocer_export.save
        format.html { redirect_to @grocer_export, notice: 'Export was successfully created.' }
        format.json { render :show, status: :created, location: @grocer_export }
      else
        format.html { render :new }
        format.json { render json: @grocer_export.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grocer/exports/1
  # PATCH/PUT /grocer/exports/1.json
  def update
    respond_to do |format|
      if @grocer_export.update(grocer_export_params)
        format.html { redirect_to @grocer_export, notice: 'Export was successfully updated.' }
        format.json { render :show, status: :ok, location: @grocer_export }
      else
        format.html { render :edit }
        format.json { render json: @grocer_export.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grocer/exports/1
  # DELETE /grocer/exports/1.json
  def destroy
    @grocer_export.destroy
    respond_to do |format|
      format.html { redirect_to grocer_exports_url, notice: 'Export was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grocer_export
      @grocer_export = Grocer::Export.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grocer_export_params
      params.require(:grocer_export).permit(:pid, :job, :status, :last_error, :last_success, :logfile)
    end
end
