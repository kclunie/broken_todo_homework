class Api::ItemsController < ApplicationController

    before_action :set_project

    def index
        @items = Item.all
        render json: @items
    end

    def show
        @item = Item.find_by(id: params[:id])
        render json: @item
    end

    private

    def set_project
        @project = Project.find(params[:project_id])
    end

end