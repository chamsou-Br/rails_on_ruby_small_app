class Invitation < ApplicationRecord

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  has_many :transactions
  belongs_to :seller

  # Define the Elasticsearch index configuration
  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :product, analyzer: 'english', index_options: 'offsets'
    end
  end

  def as_indexed_json(_options = {})
  as_json(only: [ :uuid , :product , :description, :price, :store_wilaya, :store_location, :delivery_type, :local_delivery_price, :active, :delivery_delay_hours, :date, :images , :seller_id])
  end

  def self.search_by_default(query)
    __elasticsearch__.search(
      {
        query: {
          match: {
            product: query
          }
        }
      }
    )
  end

end
