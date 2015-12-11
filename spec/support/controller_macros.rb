module ControllerMacros
  def login_teachers
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:teacher]
      sign_in FactoryGirl.create(:teacher) # Using factory girl as an example
    end
  end
end