class Log < ApplicationRecord
    validates :query, presence: true
    validates :ip_address, presence: true
    validates :count, presence: true
    validates :query, uniqueness: { scope: :ip_address }

    def self.search(query, ip_address)
        #Create a new log if it doesn't exist, otherwise increment the existing query's count
        log = find_or_create_by(query: query, ip_address: ip_address)
        log.increment!(:count)
        log
    end
end
