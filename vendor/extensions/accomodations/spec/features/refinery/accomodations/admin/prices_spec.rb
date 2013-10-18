# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Accomodations" do
    describe "Admin" do
      describe "prices" do
        refinery_login_with :refinery_user

        describe "prices list" do
          before do
            FactoryGirl.create(:price, :distribution => "UniqueTitleOne")
            FactoryGirl.create(:price, :distribution => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.accomodations_admin_prices_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.accomodations_admin_prices_path

            click_link "Add New Price"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Distribution", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Accomodations::Price.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Distribution can't be blank")
              Refinery::Accomodations::Price.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:price, :distribution => "UniqueTitle") }

            it "should fail" do
              visit refinery.accomodations_admin_prices_path

              click_link "Add New Price"

              fill_in "Distribution", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Accomodations::Price.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:price, :distribution => "A distribution") }

          it "should succeed" do
            visit refinery.accomodations_admin_prices_path

            within ".actions" do
              click_link "Edit this price"
            end

            fill_in "Distribution", :with => "A different distribution"
            click_button "Save"

            page.should have_content("'A different distribution' was successfully updated.")
            page.should have_no_content("A distribution")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:price, :distribution => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.accomodations_admin_prices_path

            click_link "Remove this price forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Accomodations::Price.count.should == 0
          end
        end

      end
    end
  end
end
