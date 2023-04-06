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

RSpec.describe "/admin/events", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Admin::Event. As you add validations to Admin::Event, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Admin::Event.create! valid_attributes
      get admin_events_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      event = Admin::Event.create! valid_attributes
      get admin_event_url(event)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_admin_event_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      event = Admin::Event.create! valid_attributes
      get edit_admin_event_url(event)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Admin::Event" do
        expect {
          post admin_events_url, params: { admin_event: valid_attributes }
        }.to change(Admin::Event, :count).by(1)
      end

      it "redirects to the created admin_event" do
        post admin_events_url, params: { admin_event: valid_attributes }
        expect(response).to redirect_to(admin_event_url(Admin::Event.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Admin::Event" do
        expect {
          post admin_events_url, params: { admin_event: invalid_attributes }
        }.to change(Admin::Event, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post admin_events_url, params: { admin_event: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested admin_event" do
        event = Admin::Event.create! valid_attributes
        patch admin_event_url(event), params: { admin_event: new_attributes }
        event.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the admin_event" do
        event = Admin::Event.create! valid_attributes
        patch admin_event_url(event), params: { admin_event: new_attributes }
        event.reload
        expect(response).to redirect_to(admin_event_url(event))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        event = Admin::Event.create! valid_attributes
        patch admin_event_url(event), params: { admin_event: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested admin_event" do
      event = Admin::Event.create! valid_attributes
      expect {
        delete admin_event_url(event)
      }.to change(Admin::Event, :count).by(-1)
    end

    it "redirects to the admin_events list" do
      event = Admin::Event.create! valid_attributes
      delete admin_event_url(event)
      expect(response).to redirect_to(admin_events_url)
    end
  end
end