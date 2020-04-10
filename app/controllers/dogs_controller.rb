class DogsController < ApplicationController

    def index
        @dogs = Dog.all
        @dogs_order = @dogs.sort_by { |dog| dog.employees.length }
        
    end

    def show
        @dog = Dog.find(params[:id])
    end

end
