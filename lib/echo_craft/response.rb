# frozen_string_literal: true

module EchoCraft
  # Basic Response with EchoCraft Struct
  class Response
    require 'rack'
    require 'ostruct'

    attr_reader :status, :message, :data

    def initialize
      change_status(:processing)
      @data = ::OpenStruct.new
    end

    def status=(status)
      change_status(status)
    end

    def change_status(status)
      @status = ::Rack::Utils.status_code(status)
      @message = ::Rack::Utils::HTTP_STATUS_CODES[@status]
      @status
    end
  end
end
