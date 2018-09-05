module TenantAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        # virtual field
        configure :count_requests do
          # any configuration
        end
        fields :name, :api_key, :count_requests, :created_at, :updated_at
      end

      show do
        # virtual field
        configure :count_requests do
          # any configuration
        end
        fields :name, :api_key, :count_requests, :created_at, :updated_at
      end
    end
  end
end
