class Admin::LinesController < AdminController
  def create
    @line = Line.create(line_params)
    redirect_to admin_category_page_graph_url(@line.graph.page.category,
                                              @line.graph.page,
                                              @line.graph)
  end

  def update
    @line = Line.find(params[:id])
    respond_to do |format|
      if @line.update(line_params)
        format.json { render json: @line }
      else
        format.json { render json: @line.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def line_params
    params.require(:line)
          .permit(:title, :line_id)
  end
end
