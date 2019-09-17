class URL
    include HTTParty

    def self.query_service(url_api)
        case url_api
        when "api"
            base_uri 'https://api-v2.idwall.co'
        end
    end
end