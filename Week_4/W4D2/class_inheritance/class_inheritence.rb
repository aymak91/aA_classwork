class Employee
    
    attr_reader :salary

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        @salary * multiplier
    end
end

class Manager < Employee
    attr_reader :employees
    def initialize(name, title, salary, boss, employees)
        super(name, title, salary, boss)
        @employees = employees
    end

    def bonus(multiplier)    
        employee_salary_sum = 0
        employees.each do |employee|
            employee_salary_sum += employee.salary
        end
        employee_salary_sum * multiplier
    end

end

