class Admin::TicketsController < AdminController
  before_action :set_admin_ticket, only: %i[ show edit update destroy ]

  # GET /admin/tickets or /admin/tickets.json
  def index
    @admin_tickets = Admin::Ticket.all
  end

  # GET /admin/tickets/1 or /admin/tickets/1.json
  def show
  end

  # GET /admin/tickets/new
  def new
    @admin_ticket = Admin::Ticket.new
    @admin_events = Admin::Event.all
    if @admin_events.empty?
      flash[:error] = "There are no events to create tickets for."
      redirect_to admin_tickets_path
    end
  end

  # GET /admin/tickets/1/edit
  def edit
    @admin_events = Admin::Event.all
  end

  # POST /admin/tickets or /admin/tickets.json
  def create
    @admin_ticket = Admin::Ticket.new(admin_ticket_params)
    @admin_ticket.name = @admin_ticket.admin_event.name if @admin_ticket.admin_event.present?


    respond_to do |format|
      if @admin_ticket.save
        format.html { redirect_to admin_ticket_url(@admin_ticket), notice: "Ticket was successfully created." }
        format.json { render :show, status: :created, location: @admin_ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/tickets/1 or /admin/tickets/1.json
  def update
    respond_to do |format|
      if @admin_ticket.update(admin_ticket_params)
        format.html { redirect_to admin_ticket_url(@admin_ticket), notice: "Ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/tickets/1 or /admin/tickets/1.json
  def destroy
    @admin_ticket.destroy

    respond_to do |format|
      format.html { redirect_to admin_tickets_url, notice: "Ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_ticket
      @admin_ticket = Admin::Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_ticket_params
      params.require(:admin_ticket).permit(:name, :price, :ticket_type, :vip_seats, :regular_seats, :admin_event_id)
    end
end
