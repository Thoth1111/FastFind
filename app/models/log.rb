class Log < ApplicationRecord
    validates :query, presence: true
    validates :ip_address, presence: true
    validates :count, presence: true
    validates :query, uniqueness: { scope: :ip_address }

end
