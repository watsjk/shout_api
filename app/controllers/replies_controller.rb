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
  end

  # Only allow a list of trusted parameters through.
  def reply_params_create
    params.require(:reply).permit(:comment, :post_id, :reply_to_id)
  end

  def reply_params_update
    params.require(:reply).permit(:comment)
  end
end
