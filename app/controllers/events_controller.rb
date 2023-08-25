class EventsController < ApplicationController
  before_action :set_event, only: %i[ show ]
  before_action :set_category

  def index
    @events = Event.includes(:tickets).all
    @upcoming_events = Event.upcoming
    @past_events = Event.past
    # @admin_events = Admin::Event.all
    # @admin_tickets = Admin::Ticket.all
  end

  def show
    @tickets = @event.tickets
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def set_category
      @categories = Category.all
    end
    
end
