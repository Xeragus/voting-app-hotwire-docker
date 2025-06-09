require 'rails_helper'

RSpec.describe "Polls", type: :request do
  describe "GET /polls" do
    context "when there are polls" do
      let!(:poll1) { create(:poll, question: "What is your favorite color?") }
      let!(:poll2) { create(:poll, question: "Best programming language?") }

      before do
        create(:option, poll: poll1)
        create(:option, poll: poll2)
      end

      it "returns a successful response" do
        get polls_path
        expect(response).to have_http_status(:ok)
      end

      it "displays each poll's question" do
        get polls_path
        expect(response.body).to include("What is your favorite color?")
        expect(response.body).to include("Best programming language?")
      end

      it "shows vote counts for each poll (even if 0)" do
        get polls_path
        expect(response.body).to include("0 votes")
      end
    end

    context "when there are no polls" do
      it "shows a message indicating no polls" do
        get polls_path
        expect(response.body).to include("🗳️ No available polls, please run the seeder")
      end
    end
  end

  describe "GET /polls/:id" do
    context "when the poll exists" do
      let(:poll) { create(:poll, question: "What’s your favorite season?") }
      let!(:option1) { create(:option, poll: poll, text: "Spring") }
      let!(:option2) { create(:option, poll: poll, text: "Winter") }

      before do
        create_list(:vote, 2, option: option1)
        create_list(:vote, 3, option: option2)
      end

      it "returns a successful response" do
        get poll_path(poll)
        expect(response).to have_http_status(:ok)
      end

      it "displays the poll question" do
        get poll_path(poll)
        expect(response.body).to include("What’s your favorite season?")
      end

      it "displays each option and its vote count" do
        get poll_path(poll)
        expect(response.body).to include("Spring")
        expect(response.body).to include("2 votes")
        expect(response.body).to include("Winter")
        expect(response.body).to include("3 votes")
      end

      it "renders vote percentage bars" do
        get poll_path(poll)
        expect(response.body).to include("40%")
        expect(response.body).to include("60%")
      end
    end

    context "when the poll does not exist" do
      it "shows a fallback message" do
        get poll_path(id: "non-existent-id")
        expect(response).to have_http_status(:ok)
        expect(response.body).to include("Poll doesn't exist.")
      end
    end
  end
end
