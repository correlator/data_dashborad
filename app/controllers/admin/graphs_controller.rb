class Admin::GraphsController < AdminController
  def index
  end

  def create
    @graph = Graph.create(graph_params)
    redirect_to admin_page_path(@graph.page)
  end

  def show
    @graph = Graph.find(params[:id])
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

  def destroy
    @graph = Graph.find_by(id: params[:id])
    if current_admin.super_admin
      @graph.destroy
    end
    redirect_to admin_content_index_url
  end

  private

  def graph_params
    ps = params.require(:graph)
          .permit(:order, :title, :unit, :page_id, :width, :style)
    ps[:admin_id] = current_admin.id
    ps
  end
end
