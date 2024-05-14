# frozen_string_literal: true

class FollowsController < ApplicationController
  before_action :set_follow, only: %i[show destroy]

  # GET /follows
  def index
    @follows = Follow.all

    render json: @follows
  end

  # GET /follows/1
  def show
    render json: @follow
  end

  # POST /follows
  def create
    @follow = Follow.new(follow_params)

    if @follow.save
      render json: @follow, status: :created, location: @follow
    else
      render json: @follow.errors, status: :unprocessable_entity
    end
  rescue ActiveRecord::NotNullViolation then render status: :unprocessable_entity
  end

  # PATCH/PUT /follows/1
  def update
    render status: :not_implemented
  end

  # DELETE /follows/1
  def destroy
    @follow.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_follow
    @follow = Follow.find(params[:id])
  rescue ActiveRecord::RecordNotFound then render status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def follow_params
    params.fetch(:follow, {}).permit(:follower_id, :following_id)
  end
end
