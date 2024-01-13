module Api
  class LogsController < ApplicationController

    def save_log
      query = params[:query]
      ip_address = request.remote_ip
      #check if log exists and update count or create a new log
      existing_log = Log.find_by(query: query, ip_address: ip_address)
      if existing_log
        existing_log.count += 1
        existing_log.save
      else
        Log.create(query: query, ip_address: ip_address)
      end

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
