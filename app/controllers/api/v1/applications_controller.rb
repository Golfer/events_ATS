class Api::V1::ApplicationsController < ApplicationController
  def index
    render json: list_applications
  end

  private

  def list_applications
    Application.includes([:job]).order(id: :asc)
  end
end
