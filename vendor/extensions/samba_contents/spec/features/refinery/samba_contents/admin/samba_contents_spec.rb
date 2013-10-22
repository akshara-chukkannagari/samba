# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "SambaContents" do
    describe "Admin" do
      describe "samba_contents" do
        refinery_login_with :refinery_user

        describe "samba_contents list" do
          before do
            FactoryGirl.create(:samba_content, :title => "UniqueTitleOne")
            FactoryGirl.create(:samba_content, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.samba_contents_admin_samba_contents_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.samba_contents_admin_samba_contents_path

            click_link "Add New Samba Content"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::SambaContents::SambaContent.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::SambaContents::SambaContent.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:samba_content, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.samba_contents_admin_samba_contents_path

              click_link "Add New Samba Content"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::SambaContents::SambaContent.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:samba_content, :title => "A title") }

          it "should succeed" do
            visit refinery.samba_contents_admin_samba_contents_path

            within ".actions" do
              click_link "Edit this samba content"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:samba_content, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.samba_contents_admin_samba_contents_path

            click_link "Remove this samba content forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::SambaContents::SambaContent.count.should == 0
          end
        end

      end
    end
  end
end
