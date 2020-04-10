class Dog < ApplicationRecord
    has_many :employees

    # def employees
    #     Employee.all.select do | employee |
    #         employee.dog_id == self.id
    #     end
    # end

end
