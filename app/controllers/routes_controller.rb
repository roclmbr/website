class RoutesController < ApplicationController
    before_action :set_route, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only: [:destroy, :create, :new]
    
  # GET /routes
  # GET /routes.json
  def index
      @routes = Route.paginate(page: params[:page], per_page: 10)
  end

  # GET /routes/1
  # GET /routes/1.json
  def show
      @route = Route.find(params[:id])
  end

  # GET /routes/new
  def new
    @route = Route.new
  end

  # GET /routes/1/edit
  def edit
      @route = Route.find(params[:id])
  end

  # POST /routes
  # POST /routes.json
  def create
      @route = Route.new(route_params)
      if @route.save
          flash[:success] = "Route was successfully created"
          redirect_to route_path(@route)
      else
          render 'new'
      end
  end

  # PATCH/PUT /routes/1
  # PATCH/PUT /routes/1.json
  def update
    if @route.update(route_params)
        flash[:success] = "Route was successfully updated"
        redirect_to route_path(@route)
    else
        render 'edit'
    end
  end

  # DELETE /routes/1
  # DELETE /routes/1.json
  def destroy
    @route.destroy
      flash[:danger] = "Route was successfully deleted"
      redirect_to routes_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_route
        @route = Route.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def route_params
        params.require(:route).permit(:name, :description, :length, :grade, :fa, :date, :gear, cliff_ids:[])
    end
    
    def require_same_user
        if !current_user.admin?
            flash[:danger] = "You can only edit or delete your own routes"
            redirect_to root_path
        end
    end
end
