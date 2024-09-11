class JobsController < ApplicationController
  def index
    @jobs = Job.all
    render json: @jobs
  end

  def show
    @job = Job.find_by(id: params[:id])
    unless @job
      render json: { error: 'Job not found' }, status: :not_found
    else
      render json: @job
    end
  end
end