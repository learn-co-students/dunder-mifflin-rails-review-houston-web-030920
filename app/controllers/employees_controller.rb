class EmployeesController < ApplicationController
    def index
        @employees = Employee.all 
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def new
        @dogs = Dog.all
    end

    def create
        array = []
        Employee.all.each do |employee|
            array << employee.alias  
        end
        if array.include?(params[:alias])
            redirect_to "/employees/new"
        else
            Employee.create(
            first_name: params[:first_name],
            last_name: params[:last_name],
            alias: params[:alias],
            office: params[:office],
            dog_id: params[:dog_id]
            )
            redirect_to "/employees"
        end
    end

    def edit
        @employee = Employee.find(params[:id])
        @dogs = Dog.all
    end

    def update
        @employee = Employee.find(params[:id])
        array = []
        Employee.all.each do |employee|
            array << employee.alias  
        end
        if array.include?(params[:alias])
            redirect_to "/employees/#{@employee.id}/edit"
        else
            @employee.update(
            first_name: params[:first_name],
            last_name: params[:last_name],
            alias: params[:alias],
            office: params[:office],
            dog_id: params[:dog_id]
            )
            redirect_to "/employees/#{@employee.id}"
        end
    end
end
