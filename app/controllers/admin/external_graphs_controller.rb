class Admin::ExternalGraphsController < AdminController
  def index
  end

  def create
    @external_graph = ExternalGraph.create(external_graph_params)
    redirect_to admin_graphs_path
  end

  def show
    @external_graph = ExternalGraph.find(params[:id])
  end

  def update
    @external_graph = ExternalGraph.find(params[:id])
    respond_to do |format|
      if @external_graph.update(external_graph_params)
        format.json { render json: @external_graph }
      else
        format.json { render json: @external_graph.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def external_graph_params
    params.require(:external_graph)
          .permit(:order, :title, :external_url, :page_id)
  end
end
