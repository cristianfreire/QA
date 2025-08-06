module Employee
    include HTTParty
    # @token = HTTParty.post("ulr da api token")
    base_uri 'https://dummy.restapiexample.com/api/v1'
    format :json
    # headers 'Content-Type': 'application/json', 'Authorization': 'Bearer ...'
    headers 'Content-Type': 'application/json'
end

    