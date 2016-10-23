class Admin::ContentController < AdminController
  def index
    @graphs = Graph.all
    @external_graphs = ExternalGraph.all
    @cards = Card.all
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
end
