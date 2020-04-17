class Api::ProjectsController < ApplicationController

    def index
        @projects = Project.all
        respond_to do |f|
            f.html {render :index}
            f.json {render json: @projects}
        end
       # render json: @projects   
    end

    def show
        @project = Project.find_by(id: params[:id])
        render json: @project
    end
    
    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)
        if @project.save
            render json: @project
        else
         render :new
        end 
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update
        @project = Project.find(params[:id])
        @project.update(project_params)
        @project.save
        render json: @project
    end

    def destroy
        @project = Project.find(params[:id])
        @project.destroy
    end

    private

    def project_params
        params.require(:project).permit(:title)
    end

end