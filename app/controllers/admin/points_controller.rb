class Admin::PointsController < AdminController
  def create
    @point = Point.create(point_params)
    redirect_to admin_graph_url(@point.line.graph.id)
  end

  def update
    @point = Point.find(params[:id])
    respond_to do |format|
      if @point.update(point_params)
        format.json { render json: @point }
      else
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def point_params
    ps = params.require(:point)
               .permit(:time, :value, :notes, :line_id)
    ps[:admin_id] = current_admin.id
    ps
  end
end
