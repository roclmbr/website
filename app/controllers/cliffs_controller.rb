class CliffsController < ApplicationController
    before_action :require_admin, except: [:index, :show]

    def index
        @cliffs = Cliff.paginate(page: params[:page], per_page: 5)
    end

    def new
        @cliff = Cliff.new
    end
    
    def create

        @cliff = Cliff.new(cliff_params)

        if @cliff.save

            flash[:success] = "Cliff was created successfully"

            redirect_to cliffs_path

        else

            render 'new'

        end

    end
    
    def edit

        @category = Category.find(params[:id])

    end

    def update

        @cliff = Cliff.find(params[:id])

        if @cliff.update(cliff_params)

            flash[:success] = "Cliff name was successfully updated"

            redirect_to cliff_path(@cliff)

        else

            render 'edit'

        end

    end

    def show
        @cliff = Cliff.find(params[:id])

        @cliff_routes = @cliff.routes.paginate(page: params[:page], per_page: 5)
    end
    
    private

        def cliff_params

            params.require(:cliff).permit(:name)

        end
    
        def require_admin

            if !logged_in? || (logged_in? and !current_user.admin?)

                flash[:danger] = "Only admins can perform that action"

                redirect_to cliffs_path

            end

        end

end