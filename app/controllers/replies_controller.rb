# frozen_string_literal: true

class RepliesController < ApplicationController
  before_action :set_reply, only: %i[show update destroy]

  # GET /replies
  def index
    @replies = Reply.all

    render json: @replies
  end

  # GET /replies/1
  def show
    render json: @reply
  end

  # POST /replies
  def create
    @reply = Reply.new(reply_params_create)

    if @reply.save
      render json: @reply, status: :created, location: @reply
    else
      render json: @reply.errors, status: :unprocessable_entity
    end
  rescue ActiveRecord::NotNullViolation then render status: :unprocessable_entity
  end

  # PATCH/PUT /replies/1
  def update
    if @reply.update(reply_params_update)
      render json: @reply
    else
      render json: @reply.errors, status: :unprocessable_entity
    end
  end

  # DELETE /replies/1
  def destroy
    @reply.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reply
    @reply = Reply.find(params[:id])
  rescue ActiveRecord::RecordNotFound then render status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def reply_params_create
    params.fetch(:reply).permit(:message, :post_id, :account_id)
  end

  def reply_params_update
    params.fetch(:reply).permit(:message)
  end
end
