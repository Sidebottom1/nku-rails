class StudentUploader
  
  def initialize(file)
    @file = file
  end
  
  def import
    umber = 0
    CSV.foreach(@file.path, :headers => true) do |row|
      user = User.find_by_email(row['email'])
      assignment = user.assignments.find_by_name(row['assignment name'])
      if !assignment.present?
        umber += 1
        assignment = Assignment.new
        assignment.user = user
        assignment.name = row['assignment name']
      end
      assignment.score = row['score']
      assignment.total = row['total']
      assignment.save!
    end
    return umber
  end
  
end