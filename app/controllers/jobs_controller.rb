class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
     @current_user = current_user
    if current_user.printers.empty?
      @jobs = current_user.jobs
    else
      @jobs = Job.where(printer: current_user.printers, status: ["Unassigned", "Accepted"]).includes(:configuration)
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
    @job.copies = 1
  end

  # GET /jobs/1/edit
  def edit
    @job.update(status: "Accepted")
    redirect_to jobs_path
  end

  # POST /jobs
  # POST /jobs.json
  def create

    printer_ids = JSON.parse(job_params[:printer])

    printers = Printer.where(id: printer_ids)

    job_params_fixed = job_params

    job_params_fixed[:printer] = nil


    printers.each do |printer|

      @job = Job.new(job_params_fixed)

      @job.printer = printer

      @job.status = "Unassigned"
      @job.save
    end

    redirect_to root_path

    # respond_to do |format|
    #   if @job.save
    #     format.html { redirect_to @job, notice: 'Job was successfully created.' }
    #     format.json { render :show, status: :created, location: @job }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @job.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to jobs_path, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:document, :copies, :configuration, :status, :printer, :description)
    end
end
