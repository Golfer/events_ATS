class JobSerializer < ActiveModel::Serializer
  cache key: 'jobs', expires_in: 30.minute

  attributes :id, :title, :status, :hired, :rejected, :ongoing
  has_many :applications
end
