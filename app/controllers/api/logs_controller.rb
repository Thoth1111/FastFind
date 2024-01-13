module Api
  class LogsController < ApplicationController

    def index
      @logs = Log.all
      render json: { status_code: 200, data: @logs }
    end
    
    def save_log
      query = params[:query]
      ip_address = request.remote_ip

      log = Log.search(query, ip_address)

      render json: { status_code: 200, message: "Log created successfully"}
    end

    def search_log
      query = params[:query]
      ip_address = request.remote_ip
      matches = Log
        .where(ip_address: ip_address)
        .where("query LIKE ?", "%#{query}%")
        .order(count: :desc)

      render json: { status_code: 200, data: matches }
    end

  end
end
