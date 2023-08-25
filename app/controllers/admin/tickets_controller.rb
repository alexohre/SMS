class Admin::TicketsController < AdminController
  before_action :set_ticket, only: %i[ show edit update destroy ]
  before_action :check_for_events, only: [:new]
  # GET /admin/tickets or /admin/tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /admin/tickets/1 or /admin/tickets/1.json
  def show
  end

  # GET /admin/tickets/new
  def new
    @ticket = Ticket.new
    @events = Event.all
  end

  # GET /admin/tickets/1/edit
  def edit
    @events = Event.all
  end

  # POST /admin/tickets or /admin/tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
    @events = Event.all
    @ticket.name = @ticket.event.name if @ticket.event.present?


    respond_to do |format|
      if @ticket.save
        format.html { redirect_to admin_ticket_url(@ticket), notice: "Ticket was successfully created." }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/tickets/1 or /admin/tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to admin_ticket_url(@ticket), notice: "Ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/tickets/1 or /admin/tickets/1.json
  def destroy
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to admin_tickets_url, notice: "Ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def check_for_events
      if Event.none?
        flash[:alert] = "Please you need to create an event before creating a ticket."
        redirect_to new_admin_event_path
      end
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:name, :price, :ticket_type, :vip_seats, :regular_seats, :event_id)
    end
end
