# frozen_string_literal: true

require 'echo_craft/service_object'

module EchoCraft
  module ServiceObjects
    # Basic Response to Create a Record on ServiceObject
    class Query < EchoCraft::ServiceObject
      attr_accessor :query, :page, :rows

      def initialize(query: [], page: 1, rows: nil)
        super()
        @query = query
        @page = page
        @rows = rows
      end

      def list(query)
        @query = query
        set_service_successful
        change_status(:ok)
      end
    end
  end
end
