# teste GET
Dado('que o usuario consulte informações de funcionario') do
    @getlist = Employee_Requests.new
end

Quando('ele realizar a pesquisa') do
    @list_employee = @getlist.find_employee
end

Entao('uma lista de funcionarios deve ser retornada') do
        expect(@list_employee.code).to eql 200
        expect(@list_employee.message).to eql 'OK'
end

# teste POST
Dado('que o usuario cadastre um novo funcionario') do
    @create = Employee_Requests.new
    # @name = Faker::Name.name
    # @salary = Faker::Number.number
    # @age = Faker::Number.number(digits: 2)
    # puts @name
    # puts @salary
    # puts @age

    @assert = Assertions.new
end


Quando('ele enviar as informações do funcionario') do
    # @create_employee = @create.create_employee(@name, @salary, @age)
    @create_employee = @create.create_employee(DATABASE[:name][:name1], DATABASE[:salary][:salary1], DATABASE[:age][:age1])
    puts @create_employee

end

Entao('esse funcionario sera cadastrado') do
    # expect(@create_employee.code).to eql (200)
    # expect(@create_employee.message).to eql 'OK'
    # expect(@create_employee["status"]).to eql 'success'
    # expect(@create_employee["message"]).to eql 'Successfully! Record has been added.'
    # expect(@create_employee.parsed_response["data"]["employee_name"]).to eql @name
    # expect(@create_employee.parsed_response["data"]["employee_salary"]).to eql @salary
    # expect(@create_employee.parsed_response["data"]["employee_age"]).to eql @age
    @assert.request_sucess(@create_employee.code, @create_employee.message)
    expect(@create_employee["status"]).to eql 'success'
    expect(@create_employee["message"]).to eql 'Successfully! Record has been added.'
    expect(@create_employee.parsed_response["data"]["employee_name"]).to eql DATABASE[:name][:name1]
    expect(@create_employee.parsed_response["data"]["employee_salary"]).to eql DATABASE[:salary][:salary1]
    expect(@create_employee.parsed_response["data"]["employee_age"]).to eql DATABASE[:age][:age1]

end

# teste PUT
Dado('que o usuario altere uma informação de funcionario') do
    @request = Employee_Requests.new
end

Quando('ele enviar as novas informações') do
    @update_employee = @request.update_employee(@request.find_employee['data'][0]['id'] , 'Alberto', 100, 40)
    puts @update_employee
end

Entao('as informações devem ser alteradas') do
    expect(@update_employee.code).to eql (200)
    expect(@update_employee.message).to eql 'OK'
    expect(@update_employee["status"]).to eql 'success'
    expect(@update_employee["message"]).to eql 'Successfully! Record has been updated.'
    expect(@update_employee.parsed_response["data"]["employee_name"]).to eql 'Alberto'
    expect(@update_employee.parsed_response["data"]["employee_salary"]).to eql (100)
    expect(@update_employee.parsed_response["data"]["employee_age"]).to eql (40)
end

# teste DELETE
Dado('que o usuario queria deletar um funcionario') do
    @request = Employee_Requests.new
end

Quando('ele enviar a identificação unica') do
    @deletade_employee = @request.deletade_employee(@request.find_employee['data'][0]['id'])
end

Entao('esse funcionario sera deletado do sistema') do
    expect(@deletade_employee.code).to eql (200)
    expect(@deletade_employee.msg).to eql 'OK'
    expect(@deletade_employee["status"]).to eql 'success'
    expect(@deletade_employee["data"]).to eql '1'
    expect(@deletade_employee["message"]).to eql 'Successfully! Record has been deleted'
end