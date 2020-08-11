class EmployeesController < ApplicationController

    def index 
        @employees = Employee.all 
    end

    def show
        @employee = Employee.find(params[:id])
        @dog = Dog.find(@employee.dog_id)
    end

    def new
    end

    def edit
    end
end
