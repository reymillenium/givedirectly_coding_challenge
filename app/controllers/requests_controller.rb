# frozen_string_literal: true

# rubocop:disable Style/Documentation
class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :update, :destroy]

  # GET /requests
  def index
    @requests = Request.all

    render json: @requests
  end

  # GET /requests/1
  def show
    render json: @request
  end

  # POST /requests
  def create
    @request = Request.new(request_params)

    if @request.save
      render json: @request, status: :created, location: @request
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /requests/1
  def update
    if @request.update(request_params)
      render json: @request
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  # DELETE /requests/1
  def destroy
    @request.destroy
  end

  def request_book_data
    payload = {
      status: 400,
      message: "invailed email"
    }
    render json: payload, status: :bad_request unless validate_email

    book = Book.find_by_title(params[:title])
    return unless book

    if book.timestamp.empty?
      book.update_attribute(:timestamp, DateTime.now)
      render json: {
        id: book.id,
        avilable: book.available,
        title: book.title,
        timestamp: book.timestamp.to_time.iso8601
      }
    end

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def request_params
    params.require(:request).permit(:email)
  end
end
