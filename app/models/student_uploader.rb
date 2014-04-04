class StudentUploader
  
  def initialize(file)
    @file = file
  end
  
  def import
    umber = 0
    CSV.foreach(@file.path, :headers => true) do |row|
      user = User.find_by_email(row['Email'])
      assignment = user.assignments.find_by_name(row['Assignment Name'])
      if !assignment.present?
        umber += 1
        assignment = Assignment.new
        assignment.user = user
        assignment.name = row['Assignment Name']
      end
      assignment.score = row['Score']
      assignment.total = row['Total']
      assignment.save!
    end
    return umber
  end
  
end