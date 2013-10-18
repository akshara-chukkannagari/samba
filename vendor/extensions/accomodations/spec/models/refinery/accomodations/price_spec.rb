require 'spec_helper'

module Refinery
  module Accomodations
    describe Price do
      describe "validations" do
        subject do
          FactoryGirl.create(:price,
          :distribution => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:distribution) { should == "Refinery CMS" }
      end
    end
  end
end
