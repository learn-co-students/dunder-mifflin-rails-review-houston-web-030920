class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end 

    def show 
        @employee = Employee.find(params[:id])
        @dog = Dog.all 
    end 

    def new 
        @dogs = Dog.all
        @employee = Employee.new
    end

    def create
        @employees= Employee.all
         @employees.each do |e|
        if e.alias == params[:alias]
            return
        end
        if e.title == params[:title]
            return
        end
        @employee = Employee.create({
            first_name: params[:first_name],
            last_name: params[:last_name],
            alias: params[:alias],
            title: params[:title], 
            office: params[:office],
            dog_id: params[:dog_id]
        })
    end
        

        redirect_to "/employees"
    end 
    def edit 
        @dogs = Dog.all
        @employee = Employee.find(params[:id])
    end 


    def update 
        @employee = Employee.find(params[:id])
        @employees= Employee.all
        @employees.each do |e|
       if e.alias == params[:alias]
           return
       end
       if e.title == params[:title]
           return
       end
        @employee.update({
            first_name: params[:first_name],
            last_name: params[:last_name],
            alias: params[:alias],
            title: params[:title], 
            office: params[:office],
            dog_id: params[:dog_id]
        })
    end
        redirect_to "/employees/#{@employee.id}"

    end


end
