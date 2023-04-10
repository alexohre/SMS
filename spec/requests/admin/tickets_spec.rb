require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/admin/tickets", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Admin::Ticket. As you add validations to Admin::Ticket, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Admin::Ticket.create! valid_attributes
      get admin_tickets_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      ticket = Admin::Ticket.create! valid_attributes
      get admin_ticket_url(ticket)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_admin_ticket_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      ticket = Admin::Ticket.create! valid_attributes
      get edit_admin_ticket_url(ticket)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Admin::Ticket" do
        expect {
          post admin_tickets_url, params: { admin_ticket: valid_attributes }
        }.to change(Admin::Ticket, :count).by(1)
      end

      it "redirects to the created admin_ticket" do
        post admin_tickets_url, params: { admin_ticket: valid_attributes }
        expect(response).to redirect_to(admin_ticket_url(Admin::Ticket.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Admin::Ticket" do
        expect {
          post admin_tickets_url, params: { admin_ticket: invalid_attributes }
        }.to change(Admin::Ticket, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post admin_tickets_url, params: { admin_ticket: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested admin_ticket" do
        ticket = Admin::Ticket.create! valid_attributes
        patch admin_ticket_url(ticket), params: { admin_ticket: new_attributes }
        ticket.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the admin_ticket" do
        ticket = Admin::Ticket.create! valid_attributes
        patch admin_ticket_url(ticket), params: { admin_ticket: new_attributes }
        ticket.reload
        expect(response).to redirect_to(admin_ticket_url(ticket))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        ticket = Admin::Ticket.create! valid_attributes
        patch admin_ticket_url(ticket), params: { admin_ticket: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested admin_ticket" do
      ticket = Admin::Ticket.create! valid_attributes
      expect {
        delete admin_ticket_url(ticket)
      }.to change(Admin::Ticket, :count).by(-1)
    end

    it "redirects to the admin_tickets list" do
      ticket = Admin::Ticket.create! valid_attributes
      delete admin_ticket_url(ticket)
      expect(response).to redirect_to(admin_tickets_url)
    end
  end
end
