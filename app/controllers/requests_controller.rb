class RequestsController < ApplicationController
    def request_params
        params.require([:user, :team])
    end

    def new
    end
    
    def create
        request
    end
    
    def destroy
        @
        redirect_to requests_path
    end
end
