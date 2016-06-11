require_relative 'java'

class CodeFactory

  def get_code_type(type)
    case type
      when 'JAVA'    then Java.new
    end
  end

end