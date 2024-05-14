# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show update destroy]

  # GET /posts
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  rescue ActiveRecord::NotNullViolation then render status: :unprocessable_entity
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params_update)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound then render status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.fetch(:post, {}).permit(:message, :private, :account_id)
  end

  def post_params_update
    params.fetch(:post, {}).permit(:message, :liked, :private)
  end
end
