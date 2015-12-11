require "rails_helper"

feature "Create student" do
	scenario "successfully" do
		visit "/teachers/sign_in"

		click_link "Sign up"

			fill_in "Email", with: "ticher@email.com"
			fill_in "Password", with: "12345678"
			fill_in "Password confirmation", with: "12345678"
			click_on "Sign up"
		
		click_on "Crear nuevo estudiante"
		
			fill_in "Nombre(s)", with: "juan"
			fill_in "Apellidos", with: "marquez"
			fill_in "Número de control", with: "7"
			fill_in "Semestre", with: "2"
			click_on "Guardar"

			expect(current_path).to eq "/"
			expect(page).to have_content "Student was successfully created."
		
	end
		scenario "unsuccessfully" do
		visit "/teachers/sign_in"

		click_link "Sign up"

			fill_in "Email", with: "ticher@email.com"
			fill_in "Password", with: "12345678"
			fill_in "Password confirmation", with: "12345678"
			click_on "Sign up"
		
		click_on "Crear nuevo estudiante"
		
			
			click_on "Guardar"

			expect(current_path).to eq "/students"
			expect(page).to have_content "First name can't be blank"
    		expect(page).to have_content "Last name can't be blank"
    		expect(page).to have_content "Control number can't be blank"
    		expect(page).to have_content "Semester can't be blank"

	end
	
end