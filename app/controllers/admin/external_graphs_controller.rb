class Admin::ExternalGraphsController < AdminController
  def index
  end

  def create
    @external_graph = ExternalGraph.create(external_graph_params)
    redirect_to admin_external_graph_path(@external_graph)
  end

  def show
    @external_graph = ExternalGraph.find(params[:id])
  end

  def update
    @external_graph = ExternalGraph.find(params[:id])
    respond_to do |format|
      if @external_graph.update(external_graph_params)
        format.html { render :show }
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
    redirect_to admin_content_index_url
  end

  private

  def external_graph_params
    ps = params.require(:external_graph)
          .permit(:order, :title, :external_url, :page_id,
                  :width, :height, :tags => [])
    ps[:admin_id] = current_admin.id
    if ps[:tags]
      ps[:tags] = ps[:tags].delete_if { |tag| tag.blank? }
      ps[:tags] = ps[:tags].map { |tag| Tag.where(name: tag).first_or_create }
    end
    ps
  end
end
