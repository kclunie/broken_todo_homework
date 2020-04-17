class Api::ItemsController < ApplicationController

    before_action :set_project

    def index
        @items = Item.all
        respond_to do |f|
            f.html {render :index}
            f.json {render json: @items}
        end
    end

    def show
        @item = Item.find_by(id: params[:id])
        render json: @item
    end

    def new
        @project = Project.find_by(id: params[:project_id])
        if params[:project_id] && project = Project.find_by_id(params[:project_id])
            @item = project.items.build 
        else
        @item = Item.new
        end 
    end

    def create
    end

    private

    def set_project
        @project = Project.find(params[:project_id])
    end

end