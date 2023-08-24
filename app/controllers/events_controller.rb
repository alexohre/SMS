class EventsController < ApplicationController
  before_action :set_admin_event, only: %i[ show edit update destroy ]
  before_action :set_admin_category

  # GET /admin/events or /admin/events.json
  def index
    @admin_events = Admin::Event.includes(:admin_tickets).all
    # @admin_events = Admin::Event.all
    # @admin_tickets = Admin::Ticket.all
  end

  # GET /admin/events/1 or /admin/events/1.json
  def show
    @admin_tickets = Admin::Ticket.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_event
      @admin_event = Admin::Event.find(params[:id])
    end

    def set_admin_category
      @admin_categories = Admin::Category.all
    end
    # Only allow a list of trusted parameters through.
    def admin_event_params
      params.require(:admin_event).permit(:name, :description, :start_date, :start_time, :duration, :photo, :admin_category_id)
    end
end
