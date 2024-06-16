class Api::V1::JobsController < ApplicationController
  def index
    render json: list_jobs
  end

  private

  def list_jobs
    Job.includes(:applications, :events).order(id: :asc).references(:events)
  end
end
