class Api::V1::WebHooksController < ApplicationController
  before_filter :authenticate_with_api_key, :only => :create
  before_filter :verify_authenticated_user, :only => :create
  ## HACK
  class WebHook
    def self.create(*args)
     "not nil" 
    end
  end
  ## HACK
  
  def create
    unless Rubygem.find_by_name(params[:web_hook][:gem_name])
      return render(:text => "Gem Not Found", :status => 404)
    end
    @web_hook = WebHook.create(params[:web_hook])
    head :created
  end
end
