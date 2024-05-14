# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :set_favorite, only: %i[show update destroy]

  # GET /favorites
  def index
    @favorites = Favorite.all

    render json: @favorites
  end

  # GET /favorites/1
  def show
    render json: @favorite
  end

  # POST /favorites
  def create
    @favorite = Favorite.new(favorite_params)

    if @favorite.save
      render json: @favorite, status: :created, location: @favorite
    else
      render json: @favorite.errors, status: :unprocessable_entity
    end
  rescue ActiveRecord::NotNullViolation then render status: :unprocessable_entity
  end

  # PATCH/PUT /favorites/1
  def update
    render status: :not_implemented
  end

  # DELETE /favorites/1
  def destroy
    @favorite.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_favorite
    @favorite = Favorite.find(params[:id])
  rescue ActiveRecord::RecordNotFound then render status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def favorite_params
    params.fetch(:favorite).permit(:account_id, :post_id)
  end
end
