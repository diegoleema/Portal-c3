class Api::TeacherController < ApplicationController

    def index
        @teachers = User.joins(:user_profile).
            eager_load(:disciplines).
            where("user_profiles.is_teacher = true").
            paginate(:page => params[:page], :per_page => 30)
        @json = []
        for teacher in @teachers
            @post = to_json teacher
            @json << @post
        end
        render :json => @json
    end
    
    def show
        @teacher = User.where(id: params[:id]).
            joins(:user_profile).
            eager_load(:disciplines).
            first
        
        render :json => to_json(@teacher)
    end
    
    private
    def to_json(teacher)
        teacher.to_json
        disciplines = []
        files = []
        if not teacher.discipline_ids.nil?
            teacher.disciplines.each do |discipline|
                disciplines << {
                    disciplinaNome: discipline.name,
                    disciplinaCodigo: discipline.code
                }
            end
        end
        if not teacher.discipline_class_ids.nil?
            teacher.discipline_classes.each do |discipline|
                files << {
                    turmaNome: discipline.name,
                    disciplinaCodigo: discipline.discipline.code,
                    arquivos: discipline.make_json(request)
                }
            end
        end
        {
            professorId: teacher.id,
            professorNome: teacher.name,
            professorLattes: teacher.profile.lattes,
            professorTitulacao: teacher.profile.degree,
            professorCargo: (teacher.profile.role.nil? ? 'Professor' : teacher.profile.role),
            professorImagemUrl: "#{request.protocol}#{request.host}#{teacher.avatar.url}",
            professorInteresses: teacher.profile.interests,
            professorEmail: teacher.email,
            professorTelefone: teacher.profile.phone,
            professorDisciplinas: disciplines,
            professorDisciplinasArquivos: files
        }
    end

end
