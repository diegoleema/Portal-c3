class DisciplineController < ApplicationController
  def index
    @semester = if params.has_key?(:semester) then Integer(params[:semester]) else 1 end
    if (@semester < 1)
      @semester = 1
    end
    @shift = if params.has_key?(:shift) then Integer(params[:shift]) else Discipline.shifts[:night] end
    if @shift != Discipline.shifts[:night] && @shift != Discipline.shifts[:noon]
      @shift = Discipline.shifts[:night]
    end    
    @max_semesters = Discipline.max_semester(@shift)
    @disciplines = Discipline.from_semester_and_shift(@semester, @shift)
  end
end
