Dado('que o usuario consulte informações de funcionario') do
    @get_url = 'https://dummy.restapiexample.com/api/v1/employees'
end

Quando('ele realizar a pesquisa') do
    @list_employee = HTTParty.get(@get_url)
end

Entao('uma lista de funcionarios deve ser retornada') do
        expect(@list_employee.code).to eql 200
        expect(@list_employee.message).to eql 'OK'
end


Dado('que o usuario cadastre um novo funcionario') do
    @post_url = "http://dummy.restapiexample.com/api/v1/create"
end

Quando('ele enviar as informações do funcionario') do
    @create_employee = HTTParty.post(@post_url, :headers => {'Content-Type': 'application/json'}, body: {
        "employee_name": "Joao",
        "employee_salary": 20000,
        "employee_age": 23,
        "profile_image": ""
    }.to_json)

end

Entao('esse funcionario sera cadastrado') do
    expect(@create_employee.code).to eql (200)
    expect(@create_employee.message).to eql 'OK'
    expect(@create_employee["status"]).to eql 'success'
    expect(@create_employee["message"]).to eql 'Successfully! Record has been added.'
    expect(@create_employee.parsed_response["data"]["employee_name"]).to eql 'Joao'
    expect(@create_employee.parsed_response["data"]["employee_salary"]).to eql (20000)
    expect(@create_employee.parsed_response["data"]["employee_age"]).to eql (23)

end