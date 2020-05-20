class Api::ItemsController < ApplicationController

    before_action :get_project

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
        @item = @project.items.build
      end
    
      def create
        @item = @project.items.build(item_params)
    
        respond_to do |format|
          if @item.save
            format.html { redirect_to api_project_path(@project),
                          :notice => 'Item was amazingly created.' }
          else
            format.html { render :action => 'new' }
          end
        end
      end

    # def new
    #     @project = Project.find_by(id: params[:project_id])
    #     if params[:project_id] && project = Project.find_by_id(params[:project_id])
    #         @item = project.items.build 
    #     else
    #     @item = Item.new
    #     end 
    # end

    # def create
    # end

    def edit
        @item = Item.find(params[:id])
    end
    
    def update
        @item = @project.items.where("id = #{params[:id]}").first
    
        respond_to do |format|
          if @item.update(item_params)
            format.html { redirect_to api_project_path(@project),
                          :notice => 'Item was successfully updated.' }
          else
            format.html { render :action => 'edit' }
          end
        end
    end

    private

    def get_project
        @project = Project.find(params[:project_id])
    end

    def item_params
        params.require(:item).permit(:action, :done)
    end

end