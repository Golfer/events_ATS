class ApplicationSerializer < ActiveModel::Serializer
  cache key: 'applications', expires_in: 30.minute

  attributes :id, :full_name, :last_interview_date, :status, :job_title, :count_notes

  def job_title
    object.job.title
  end

  def count_notes
    object.list_notes.count
  end
end
