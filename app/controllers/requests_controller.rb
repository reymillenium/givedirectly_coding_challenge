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
    email = request_book_data_params.fetch(:email, {})
    invalid_email = {
      status: 400,
      message: t('errors.resources.detailed_invalid', resource: 'email', details: email)
    }
    render json: invalid_email, status: :bad_request unless a_valid_email?(email)

    book = Book.find_by_title(params[:title])
    not_found_book = {
      status: 404,
      message: t('errors.resources.not_found', resource: 'book')
    }
    render json: not_found_book, status: :not_found unless book

    if book && a_valid_email?(params[:email])
      was_available = book.request.nil?
      @request = was_available ? Request.new(request_params.merge(book_id: book.id)) : book.request
      @request.save unless @request.persisted?

      render json: {
        id: book.id,
        available: was_available,
        title: book.title,
        timestamp: @request.created_at.to_time.iso8601
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

  def request_book_data_params
    params.require(:request).permit(:email, :title)
  end
end
