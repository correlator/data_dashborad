class Admin::ContentController < AdminController
  def index
    @graphs = Graph.all
    @external_graphs = ExternalGraph.all
    @cards = Card.all
  end

  def create
    @content = Content.create(content_params)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    if current_admin.super_admin
      @content = Content.find(params[:id])
      @content.destroy
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def content_params
    params.require(:content)
          .permit(:page_id, :content_type, :content_id, :order)
  end
end
