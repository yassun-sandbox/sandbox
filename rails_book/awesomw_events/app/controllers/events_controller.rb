class EventsController < ApplicationController
  before_action :authenticate, expect: :show

  def show
    @event = Event.find(params[:id])
    @tickets = @event.tickets.includes(:user).order(:created_at)
  end

  def new
    @event = current_user.created_events.build
  end

  def edit
    @event = current_user.created_events.find(params[:id])
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event, notice: '作成しました'
    else
      render :new
    end
  end

  def update
    @event = current_user.created_events.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to @event, notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @event = current_user.created_events.find(params[:id])
    @event.destroy!
    redirect_to root_path, notice: '削除しました' 
  end

 private

  def event_params
    params.require(:event).permit(
      :name, :place, :event_image, :event_image_cache,
      :remove_event_image, :content, :start_time, :end_time
    )
  end

end
