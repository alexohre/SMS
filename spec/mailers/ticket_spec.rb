require "rails_helper"

RSpec.describe TicketMailer, type: :mailer do
  describe "thanks" do
    let(:mail) { TicketMailer.thanks }

    it "renders the headers" do
      expect(mail.subject).to eq("Thanks")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
