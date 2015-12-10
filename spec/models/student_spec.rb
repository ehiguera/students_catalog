require "rails_helper"
describe Student do 
	describe "validations" do
		it "fails to save" do
			student = Student.new
			student.save
			expect(student).to_not be_persisted
		end

		it "validates presence of first_name" do
			student = Student.new(last_name: "Torres", birthdate: "01/01/2010", control_number: "2", semester: "2")
			student.save
			expect(student.errors.full_messages).to eq(["First name can't be blank"])
		end

		it "validates presence of last_name" do
			student = Student.new(first_name: "Jesus", birthdate: "01/01/2010", control_number: "2", semester: "2")
			student.save
			expect(student.errors.full_messages).to eq(["Last name can't be blank"])
		end

		it "validates presence of birthdate" do
			student = Student.new(first_name: "Jesus", last_name: "Torres", control_number: "2", semester: "2")
			student.save
			expect(student.errors.full_messages).to eq(["Birthdate can't be blank"])
		end

		it "validates presence of control_number" do
			student = Student.new(first_name: "Jesus", last_name: "Torres", birthdate: "01/01/2010", semester: "2")
			student.save
			expect(student.errors.full_messages).to eq(["Control number can't be blank"])
		end

		it "validates presence of semester" do
			student = Student.new(first_name: "Jesus", last_name: "Torres", birthdate: "01/01/2010", control_number: "2")
			student.save
			expect(student.errors.full_messages).to eq(["Semester can't be blank"])
		end

		 it "validates uniqueness of first_name" do
      		Student.create(first_name: "Jesus", last_name: "Torres", birthdate: "1/1/2010", control_number:"2", semester: "2" )
      		student = Student.new(first_name: "Jesus", last_name: "Torres", birthdate: "1/1/2010", control_number:"2", semester: "2" )
      		student.save
      		expect(student.errors.full_messages).to eq(["First name has already been taken"])
    	end
	end

	describe "#name" do
		it "returns complete student name" do
			student = Student.create!(first_name: "Jesus", last_name: "Torres", birthdate: "01/01/2010", control_number: "2", semester: "2")
			expect(student.name).to eq "Jesus Torres"
		end
	end

end