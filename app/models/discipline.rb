# Esta classe representa a disciplina do curso
class Discipline < ActiveRecord::Base
    enum shift: [:noon, :night]
    
    # Identifica como uma relação many to many com a classe User
    has_and_belongs_to_many :users
    
    # Identifica que um usuário de disciplina é um professor para quesitos de facilidade
    # de leitura e entendimento
    alias :teachers :users
    
    # Este método retorna o maior semestre da lista de disciplinas
    def self.max_semester(shift)
        Discipline.where(shift: shift).maximum(:semester)
    end
    
    # Este método retorna as disciplinas de um determinado turno e período
    def self.from_semester_and_shift(semester, shift)
        Discipline.where shift: shift, semester: semester
    end
    
end
