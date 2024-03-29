# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Accomodations" do
    describe "Admin" do
      describe "businesses" do
        refinery_login_with :refinery_user

        describe "businesses list" do
          before do
            FactoryGirl.create(:business, :name => "UniqueTitleOne")
            FactoryGirl.create(:business, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.accomodations_admin_businesses_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.accomodations_admin_businesses_path

            click_link "Add New Business"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Accomodations::Business.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Accomodations::Business.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:business, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.accomodations_admin_businesses_path

              click_link "Add New Business"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Accomodations::Business.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:business, :name => "A name") }

          it "should succeed" do
            visit refinery.accomodations_admin_businesses_path

            within ".actions" do
              click_link "Edit this business"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:business, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.accomodations_admin_businesses_path

            click_link "Remove this business forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Accomodations::Business.count.should == 0
          end
        end

      end
    end
  end
end
