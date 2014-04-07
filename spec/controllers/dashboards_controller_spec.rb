require 'spec_helper'

describe DashboardsController do
	render_views

	before(:each) do 
		@container = create(:container)
		@measurement_1 = create(:measurement)
		@measurement_2 = create(:measurement)
	end

	describe "index" do
		it "should contain information from container and measurements" do
			get :index
			expect(response.body).to include("<p class=\"announcement-heading\">1</p>")
			expect(response.body).to include("<p class=\"announcement-heading\">2</p>")
		end
	end
end
