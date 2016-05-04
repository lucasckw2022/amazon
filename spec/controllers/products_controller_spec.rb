require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "#new" do
    it "renders the new template"
    it "assigns a campaign object"

  end

  describe "#create" do
    describe "with valid attributes" do
      it "saves a record to the database"
      it "redirects to the campaign's show page"
      it "sets a flash message"
    end
    describe "with invalid attributes" do
      it "renders the new template"
      it "sets an alert message"
      it "doesn't save a record to the database"
    end
  end

  describe "#show" do
    it "renders the show template"
    it "sets a campaign instance variable"
  end

  describe "#index" do
    it "renders the index template"
    it "assigns an instance variable to all campaigns in the DB"
  end

  describe "#edit" do
    it "renders the edit template"
    it "sets an instance varible with the passed id"
  end

  describe "#update" do
    describe "with valid params" do
      it "updates the record whose id is passed"
      it "redirects to show page"
      it "sets a flash notice message"
    end
    describe "with invalid params" do
      it "doesnt update the record "
      it "render the edit template"
    end
  end

  describe "#destroy" do
    it "removes the campaign from the database"
    it "redirect to the index page"
    it "sets a flash"
  end
end
