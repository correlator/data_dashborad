class Admin::CardsController < AdminController
  def index
    @cards = Card.all
  end

  def create
    @card = Card.create(card_params)
    redirect_to "#{admin_card_path(@card)}"
  end

  def show
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    respond_to do |format|
      if @card.update(card_params)
        format.html { render :show }
        format.json { render json: @card }
      else
        format.html { render :show }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @card = Card.find_by(id: params[:id])
    if current_admin.super_admin
      @card.destroy
    end
    redirect_to admin_content_index_url
  end

  private

  def card_params
    ps = params.require(:card)
               .permit(:order, :title, :goal, :goal_date, :value, :value_date,
                       :source, :trend, :icon, :page_id, :color,
                       :percentage_complete, :tags => [])
    ps[:admin_id] = current_admin.id
    ps[:tags] = ps[:tags].delete_if { |tag| tag.blank? }
    ps[:tags] = ps[:tags].map { |tag| Tag.where(name: tag).first_or_create }
    ps
  end
end
