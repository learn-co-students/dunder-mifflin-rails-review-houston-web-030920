class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end
    def show
        @employee = Employee.find(params[:id])
        @dog = Dog.find_by(id: @employee.dog_id)
    end
    def new
        @dogs = Dog.all
    end
    def create
        @employees = Employee.all
        if @employees.find_by(alias: params[:alias])
            puts "Don't be a copycat"
            redirect_to '/employees/new'
        elsif @employees.find_by(title: params[:title])
            puts "This isn't funny, Jim"
            redirect_to '/employees/new'
        else
        @employee = Employee.create({first_name: params[:first_name],
            last_name: params[:last_name],
            lias: params[:alias],
            title: params[:title],
            office: params[:office],
            img_url: params[:img_url],
            dog_id: params[:dog_id]})
            redirect_to '/employees'
        end
    end

    def edit
        @dogs = Dog.all
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find_by(id: params[:id])
        @employees = Employee.all
        if @employees.find_by(alias: params[:alias])
            puts "Don't be a copycat"
            redirect_to '/employees/new'
        elsif @employees.find_by(title: params[:title])
            puts "This isn't funny, Jim"
            redirect_to '/employees/new'
        else
        @employee.update(first_name: params[:first_name],
            last_name: params[:last_name],
            alias: params[:alias],
            title: params[:title],
            office: params[:office],
            img_url: params[:img_url],
            dog_id: params[:dog_id])
            redirect_to '/employees'
        end
    end


    
end
