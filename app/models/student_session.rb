class StudentSession < ActiveRecord::Base
	belongs_to :user
	has_many :student_session_data
	has_many :session_assessments
	has_one :session_activity_data
	has_many :session_activity_levels_data
	
	START_STATE = 'START'
  
    ENDED_STATE = 'ENDED'

    def self.start(user)

      if !user.nil?
        student = Student.find_by(user_id: user.id)
        if !student.nil?
          student_session = StudentSession.create(student: student, user_id: user.id, state: START_STATE, generated_id: SecureRandom.uuid)
          return student_session
        end
      end
    end

    def self.end(student_session_id)
    	if !student_session_id.blank?
    		StudentSession.where(id: student_session_id).update_all(state: ENDED_STATE)
    	end
    end

    def self.post_data(student_session_id, data)
      if !student_session_id.blank?
        StudentSessionData.create(student_session_id: student_session_id, data: data)
      end
    end

end


  #Constants
