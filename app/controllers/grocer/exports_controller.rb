module Grocer
  class ExportsController < ApplicationController
    before_action :set_export, only: [:show]

    # GET /exports
    def index
      @exports = status ? Export.where(status: status).page(page) : Export.page(page)
      @counts = Export.group(:status).count
    end

    # GET /exports/1
    def show; end

    # GET /exports/new
    def new
      @export = Export.new
    end

    # POST /exports
    def create
      @export = Export.new(export_params)

      if @export.save
        redirect_to @export, notice: 'Export was successfully created.'
      else
        render :new
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_export
      @export = Export.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def export_params
      params.require(:export).permit(:pid, :job, :status, :last_error, :last_success, :logfile,
                                     :page)
    end

    def page
      params[:page]
    end

    def status
      params[:status]
    end
  end
end
