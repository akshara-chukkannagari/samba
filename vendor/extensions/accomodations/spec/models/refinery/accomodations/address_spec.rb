require 'spec_helper'

module Refinery
  module Accomodations
    describe Address do
      describe "validations" do
        subject do
          FactoryGirl.create(:address,
          :street => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:street) { should == "Refinery CMS" }
      end
    end
  end
end
