require 'rails_helper'

RSpec.describe "Votes", type: :request do
  describe "POST /votes" do
    let(:poll) { create(:poll, question: "Choose your favorite fruit") }
    let!(:option1) { create(:option, poll: poll, text: "Apple") }
    let!(:option2) { create(:option, poll: poll, text: "Banana") }

    context "with Turbo Stream format" do
      it "creates a vote and returns a Turbo Stream response" do
        expect {
          post votes_path, params: { option_id: option1.id }, headers: { "ACCEPT" => "text/vnd.turbo-stream.html" }
        }.to change { option1.votes.count }.by(1)

        expect(response).to have_http_status(:ok)
        expect(response.media_type).to eq("text/vnd.turbo-stream.html")

        # Confirm turbo-stream targets were rendered
        expect(response.body).to include("turbo-stream")
        expect(response.body).to include("poll_options_") # dynamic target div
        expect(response.body).to include("Apple")
        expect(response.body).to include("You have successfully voted for option")
      end
    end

    context "with HTML format" do
      it "creates a vote and redirects to the poll page" do
        expect {
          post votes_path, params: { option_id: option2.id }
        }.to change { option2.votes.count }.by(1)

        expect(response).to redirect_to(poll_path(poll))
        follow_redirect!

        expect(response.body).to include("Banana")
        expect(response.body).to include("You have successfully voted for option")
      end
    end
  end
end
