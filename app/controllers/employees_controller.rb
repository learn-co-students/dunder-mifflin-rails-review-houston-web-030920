
class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def edit
        @dogs = Dog.all
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find(params[:id])
        @employee.update({
        first_name: params[:first_name],
        dog_id: params[:dog_id],
        alias: params[:alias],
        office: params[:office],
        last_name: params[:last_name],
        img_url: params[:img_url],
        title: params[:title]
    })
    
    render(:show)
    end

    def new
        @dogs = Dog.all
    end

    def create 
        @employees = Employee.all
        @employee = Employee.create({
            first_name: params[:first_name],
            dog_id: params[:dog_id],
            alias: params[:alias],
            office: params[:office],
            last_name: params[:last_name],
            img_url: params[:image_url],
            title: params[:title]
        })
        title_arr = @employees.map{|employee| employee.title}
        title_arr.pop
        if title_arr.any?(@employee.title)
            @employee.destroy
            @dogs = Dog.all
            render(:new)
        else
            render(:index)
        end

    end
end
