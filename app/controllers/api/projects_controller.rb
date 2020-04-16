class Api::ProjectsController < ApplicationController

    def index
        @projects = Project.all
        render json: @projects   
        # respond_to do |f|
        #     f.html {render :index}
        #     f.json {render json: @projects}
        # end 
    end

    

end