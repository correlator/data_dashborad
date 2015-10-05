class Admin::GraphsController < AdminController
  def index
    @graphs = Graph.all
    @graph = Graph.new
  end

  def create
    @graph = Graph.create(graph_params)
    redirect_to admin_graphs_path
  end

  def update
    @graph = Graph.find(params[:id])
    respond_to do |format|
      if @graph.update(graph_params)
        format.json { render json: @graph }
      else
        format.json { render json: @graph.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def graph_params
    ps = params.require(:graph)
               .permit(:order, :title, :unit, :page_id)
  end
end
