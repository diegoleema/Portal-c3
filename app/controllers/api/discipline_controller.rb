class Api::DisciplineController < ApplicationController

    def index
        #@semester = if params.has_key?(:semester) then Integer(params[:semester]) else 1 end
        #if (@semester < 1)
        #@semester = 1
        #end
        @shift = if params.has_key?(:shift) then Integer(params[:shift]) else Discipline.shifts[:night] end
        if @shift != Discipline.shifts[:night] && @shift != Discipline.shifts[:noon]
        @shift = Discipline.shifts[:night]
        end    
        #@max_semesters = Discipline.max_semester(@shift)
        #@disciplines = Discipline.from_semester_and_shift(@semester, @shift)
        @disciplines = Discipline.all
        @json_disciplines = []
        for oportunity in @disciplines
            discipline = to_json oportunity
            @json_disciplines << discipline
        end
        render :json => @json_disciplines
    end
    
    private
    def to_json(discipline)
        {
            disciplinaId: discipline.id,
            disciplinaCodigo: discipline.code,
            disciplinaNome: discipline.name,
            disciplinaLinkPlanoAcademico: discipline.link,
            disciplinaCreditos: discipline.credit,
            disciplinaCargaHoraria: discipline.hours,
            disciplinaTurno: discipline.shift,
            disciplinaPeriodo: discipline.semester
        }
    end

end
