require_relative 'defaults'
module API
	module V1
		class Score < Grape::API
			include API::V1::Defaults

			format :json
			resource 'students' do
				
				get 'score' do
					
					premax=5;pracmax=8;postmax=5
					#arr = SessionQuestion.where(:session_assessment_id => 52).select(:answer_id,:session_assessment_id)
					score_array = []
					pre =[]
					prac =[]
					post =[]				
					SessionAssessment.where("id > ?", 1121).pluck(:student_session_id).uniq.each do |d|
						if !d.nil?
							scores ={}

							scores["ssi"] = d
							d = d.to_int
							gg = User.joins(:student_sessions).where('student_sessions.id' => d)
							scores["name"] = gg[0]["username"]

							SessionAssessment.where(:student_session_id => d).find_each do |e|
								prescore =0
								pracscore =0
								postscore =0
								if e.assessment_type == "PRE"
									qarr = []
									Answer.joins(:session_questions).where('session_questions.session_assessment_id' => e.id).find_each do |aa|
										
										if not qarr.include?(aa["question_id"])
											if aa["correct_answer"] == "TRUE"
												prescore += 1				
											end
										end
										qarr.push(aa["question_id"])
									end
									scores["pre"] = (prescore.to_f/premax.to_f)*100
									pre.push(prescore)
								elsif e.assessment_type == "PRACTICE"
									qarr = []
									Answer.joins(:session_questions).where('session_questions.session_assessment_id' => e.id).find_each do |aa|
										if not qarr.include?(aa["question_id"])
											if aa["correct_answer"] == "TRUE"
												pracscore += 1				
											end
										end
										qarr.push(aa["question_id"])
									end
									scores["prac"] = (pracscore.to_f/pracmax.to_f)*100
									prac.push(pracscore)
								elsif e.assessment_type == "POST"
									qarr = []
									Answer.joins(:session_questions).where('session_questions.session_assessment_id' => e.id).find_each do |aa|
										if not qarr.include?(aa["question_id"])
											if aa["correct_answer"] == "TRUE"
												postscore += 1				
											end
										end
										qarr.push(aa["question_id"])
									end
									scores["post"] = (postscore.to_f/postmax.to_f)*100
									post.push(postscore)
								end

								score_array.push(scores)
							end
							
							
						end
						
						
					end
					{"scores" => score_array,"preavg" => pre.inject(:+)/pre.length,"pracavg" => prac.inject(:+)/prac.length,"postavg" => post.inject(:+)/post.length,"premax" => pre.max,"pracmax" => prac.max,"postmax" => post.max,"premin" => pre.min,"pracmin" => prac.min,"postmin" => post.min}
						
				end

				get 'vidtime' do 
					time = []
			
					SessionVideoData.where("id > ?",400).find_each do |ll|
						puts ll
						#if ll["student_session_id"].in?([1..2])
						tm = {}
						t1 = ll["end_time"]
						#t2 = ll["start_time"]
						t2 = SessionAssessment.where('student_session_id' => ll['student_session_id'] ,'assessment_type' => 'PRACTICE').pluck(:start_time)
						t = t2[0] - t1
						tm["time"] = Time.at(t).utc.strftime("%H:%M:%S")
						tm["id"] = ll["student_session_id"]
						tm["name"] = User.joins(:student_sessions).where('student_sessions.id' => ll["student_session_id"]).pluck(:first_name)
						time.push(tm)
					end
					
					
					time
				end

				get 'shottime' do 
					time = []
					SessionActivityData.where("id >= ?",4480).find_each do |ll|
						tm = {}
						t = ll.end_time - ll.start_time
						tm["time"] = Time.at(t).utc.strftime("%H:%M:%S")
						tm["id"] = ll.student_session_id	
						tm["name"] = User.joins(:student_sessions).where('student_sessions.id' => ll["student_session_id"]).pluck(:first_name)
						time.push(tm)
					end
					time
				end

				get 'score2' do
					premax=4;pracmax=7;postmax=5
					#arr = SessionQuestion.where(:session_assessment_id => 52).select(:answer_id,:session_assessment_id)
					score_array = []
					pre =[]
					prac =[]
					post =[]				
					StudentSessionData.find_each do |js|
				    
				    	if js.student_session_id.between?(4558,4587)
							json = js.data
							json = JSON.parse(json)
							if json["session_assessment"].length == 3
							#puts json

								scores = {}
								a=0;b=0;c=0
								if json["session_assessment"].length == 3
									begin 
										pree = json["session_assessment"][0]
										pree["session_question"].each do |ss|
											if ss["result"] == "correct"
												a+=1
											end
										end
									rescue NameError => boom
										puts boom 
									end
									begin	
										pract = json["session_assessment"][1]
										pract["session_question"].each do |ss|
											if ss["result"] == "correct"
												b+=1
											end
										end
									rescue NameError => boom
										puts boom 
									end
									begin
										poste = json["session_assessment"][2]
										poste["session_question"].each do |ss|
											if ss["result"] == "correct"
												c+=1
											end
										end
									rescue NameError => boom
										puts boom 
									end
								end

								#json["session_assessment"][0]["student_session_id"]
								scores["PRE"] =a
								scores["POST"] =c
								scores["PRAC"] =b
								
								scores["name"] = User.joins(:student_sessions).where('student_sessions.id' => json["student_session_id"]).pluck(:first_name)
								scores["s_id"] =json["student_session_id"]
								
								score_array.push(scores)
							end
							#end
						end
					
					
						
					end
							
					score_array
					#{"scores" => score_array,"preavg" => pre.inject(:+)/pre.length,"pracavg" => prac.inject(:+)/prac.length,"postavg" => post.inject(:+)/post.length,"premax" => pre.max,"pracmax" => prac.max,"postmax" => post.max,"premin" => pre.min,"pracmin" => prac.min,"postmin" => post.min}
					
					
				end
				get 'pretime' do 
					arr=[]
					aa=[]
					SessionAssessment.where("id > ? AND id < ?", 1397,1711).pluck(:student_session_id).uniq.each do |d|
						if !d.nil?
							stime={}
							times={}
							d = d.to_int
							# gg = User.joins(:student_sessions).where('student_sessions.id' => d)
							# scores["name"] = gg[0]["username"]
							pre=0;prac=0;post=0;
							SessionAssessment.where(:student_session_id => d).find_each do |e|
								gg = User.joins(:student_sessions).where('student_sessions.id' => d)

								times["name"]=gg[0]["username"]
								stime["name"] =gg[0]["username"]
								if e.assessment_type == "PRE"
									t = e.end_time - e.start_time

									times["pre"] = Time.at(t).utc.strftime("%H:%M:%S")
									pre = e.start_time
								end
								if e.assessment_type == "PRACTICE"
									t = e.end_time - e.start_time
									times["practice"] = Time.at(t).utc.strftime("%H:%M:%S")

								end
								begin
									if e.assessment_type == "POST"
										t = e.end_time - e.start_time
										times["post"] = Time.at(t).utc.strftime("%H:%M:%S")
										post = e.end_time

									end
								rescue NameError => boom
									puts boom
									
								end

								arr.push(times)
							end
							begin
								y = post - pre
								stime["time"] = Time.at(y).utc.strftime("%H:%M:%S")
								aa.push(stime)
							rescue NameError => boom
								boom
							end
						end

						#arr.push(gg.student_session_id)
					end
					{"times" => arr,"stime" => aa}
				end

				get 'maxlevel' do
				#SessionActivityData.where("id > ? AND id < ?", 4537,4638)
					sadl = SessionActivityLevelsData.joins(:session_activity_data).where("student_session_id > ? AND student_session_id < ?", 4537,4638).pluck(:session_activity_data_id,:level,:activity_result)
					
					arr=[]	
					
					lev=0	
					for i in sadl
						mxlevel={}
						puts i[2]
						if i[2] ==  "Success"
							lev=i[1]
						end
						#sss = StudentSession.joins(:session_activity_data).where(:id => i[0]).pluck(:user_id)
						mxlevel["mlev"] = lev
						tt= SessionActivityData.where(:id => i[0]).pluck(:student_session_id)
						mxlevel["ssid"] = tt
						yyy= StudentSession.where(:id => tt).pluck(:user_id)
						yt=User.where(:id => yyy).pluck(:first_name)
						mxlevel["user"] = yt
						arr.push(mxlevel)
					end
					mxlevel["mlev"] = lev
					arr

				end	

				get 'cc' do 
					sss = StudentSession.joins(:session_activity_data).where(:id => 4591)
				end
				
			end




		end 
	end
end