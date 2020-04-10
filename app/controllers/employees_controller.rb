class EmployeesController < ApplicationController
    def index
        @employees= Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end
    
    def new
    
        @dogs = Dog.all
        
    end

    def create 
        @employees = Employee.all
        if @employees.find_by({alias: params[:alias]}) || @employees.find_by({title: params[:title]})
            
            puts "This is not available"
           
            redirect_to('/employees/new')
        else
            
            @employee = Employee.create({
            first_name: params[:first_name],
            last_name: params[:last_name],
            alias: params[:alias],
            title: params[:title],
            office: params[:office],
            img_url: params[:img_url],
            dog_id: params[:dog_id],
            created_at: Time.now(),
            updated_at: Time.now()
            })
            redirect_to ("/employees/#{@employee.id}")
        end
        
    end


end
