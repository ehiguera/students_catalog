require "rails_helper"


describe StudentsController do 
	login_teacher

	it "should get index" do
		get 'index'
		response.should be_success
	end
end