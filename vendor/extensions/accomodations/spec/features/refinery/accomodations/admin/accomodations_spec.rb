# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Accomodations" do
    describe "Admin" do
      describe "accomodations" do
        refinery_login_with :refinery_user

        describe "accomodations list" do
          before do
            FactoryGirl.create(:accomodation, :name => "UniqueTitleOne")
            FactoryGirl.create(:accomodation, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.accomodations_admin_accomodations_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.accomodations_admin_accomodations_path

            click_link "Add New Accomodation"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Accomodations::Accomodation.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Accomodations::Accomodation.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:accomodation, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.accomodations_admin_accomodations_path

              click_link "Add New Accomodation"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Accomodations::Accomodation.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:accomodation, :name => "A name") }

          it "should succeed" do
            visit refinery.accomodations_admin_accomodations_path

            within ".actions" do
              click_link "Edit this accomodation"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:accomodation, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.accomodations_admin_accomodations_path

            click_link "Remove this accomodation forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Accomodations::Accomodation.count.should == 0
          end
        end

      end
    end
  end
end
