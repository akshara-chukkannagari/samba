# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Accomodations" do
    describe "Admin" do
      describe "addresses" do
        refinery_login_with :refinery_user

        describe "addresses list" do
          before do
            FactoryGirl.create(:address, :street => "UniqueTitleOne")
            FactoryGirl.create(:address, :street => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.accomodations_admin_addresses_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.accomodations_admin_addresses_path

            click_link "Add New Address"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Street", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Accomodations::Address.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Street can't be blank")
              Refinery::Accomodations::Address.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:address, :street => "UniqueTitle") }

            it "should fail" do
              visit refinery.accomodations_admin_addresses_path

              click_link "Add New Address"

              fill_in "Street", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Accomodations::Address.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:address, :street => "A street") }

          it "should succeed" do
            visit refinery.accomodations_admin_addresses_path

            within ".actions" do
              click_link "Edit this address"
            end

            fill_in "Street", :with => "A different street"
            click_button "Save"

            page.should have_content("'A different street' was successfully updated.")
            page.should have_no_content("A street")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:address, :street => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.accomodations_admin_addresses_path

            click_link "Remove this address forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Accomodations::Address.count.should == 0
          end
        end

      end
    end
  end
end
