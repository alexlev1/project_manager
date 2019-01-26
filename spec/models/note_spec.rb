require 'rails_helper'

RSpec.describe Note, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @project = FactoryBot.create(:project)
  end

  it "is valid with a user, project, and message" do
    note = FactoryBot.build(:note)
    expect(note).to be_valid
  end

  it "is invalid without a message" do
    note = Note.new(message: nil)
    note.valid?
    expect(note.errors[:message]).to include("can't be blank")
  end

  describe "search message for a term" do
    before do
      @note1 = FactoryBot.create(:note)
      @note2 = FactoryBot.create(:note)
      @note3 = FactoryBot.create(:note)
    end

    context "when a match is found" do
      it "returns notes that match the search term" do
        expect(Note.search("2")).to include(@note1)
        expect(Note.search("3")).to include(@note2)
        expect(Note.search("1")).to_not include(@note3)
      end
    end

    context "when no match is found" do
      it "returns an empty collection" do
        expect(Note.search("message")).to be_empty
      end
    end
  end
end
