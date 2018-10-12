class ApiKeyGenerator
  def self.exec
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless Tenant.exists?(api_key: token)
    end
  end
end
