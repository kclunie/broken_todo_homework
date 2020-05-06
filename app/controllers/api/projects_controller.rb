class Api::ProjectsController < ApplicationController

    def index
        @projects = Project.all
        #render json: @projects
        respond_to do |f|
            f.html {render :index}
            f.json {render json: @projects}
        end  
    end

    def show
        @project = Project.find_by(id: params[:id])
        respond_to do |f|
            f.html {render :show}
            f.json {render json: @project}
        end
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