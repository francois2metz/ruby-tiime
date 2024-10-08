# frozen_string_literal: true

require 'tiime/base_model'

module Tiime
  class Invoice < BaseModel
    get :all, '/companies/#company_id/invoices'
    get :find, '/companies/#company_id/invoices/:id'
    get :pdf, '/companies/#company_id/invoices/pdf?id=:id', plain: true

    before_request :cache_refresh
    def cache_refresh(_name, request)
      BaseModel.invalidate_cache_for(self, request) if Tiime.cache_strategy == :force_refresh
      nil
    end
  end
end
