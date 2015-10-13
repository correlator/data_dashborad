class Admin::ExternalGraphsController < AdminController
  def index
    @graphs = ExternalGraph.orphaned
  end

  def create
    @external_graph = ExternalGraph.create(external_graph_params)
    redirect_to admin_category_page_path(@external_graph.page.category,
                                          @external_graph.page)
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

  def destroy
    @external_graph = ExternalGraph.find_by(id: params[:id])
    if current_admin.super_admin
      @external_graph.destroy
    end
    if @external_graph.page
      redirect_to admin_page_path(@external_graph.page)
    else
      redirect_to admin_external_graphs_path
    end
  end

  private

  def external_graph_params
    params.require(:external_graph)
          .permit(:order, :title, :external_url, :page_id)
  end
end
