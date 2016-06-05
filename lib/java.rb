require_relative 'code'

class Java < Code

  def compile_user_code(user_submitted_code, mission_Obj)

    test_cases = TestCase.where(mission_id: mission_Obj.id)

    test_cases.each do |tc|
      java_code = 'public class Code{
          ' + user_submitted_code + '

          public static void main(String args[]){

            Code c = new Code();
            int x = c.' + tc.input + ';
            System.out.println(""+x);

          }
        }'

      my_file = File.new("Code.java", "w+")
      my_file.puts(java_code)
      my_file.close
      File.chmod(0755,"Code.java")
      stdin, stdout, stderr = Open3.popen3('javac Code.java')

      puts stderr.gets
      $result = `timeout 4s java Code`

      if $result.chomp != tc.output
        return false
      end

      File.delete("Code.java")
      File.delete("Code.class")

    end

    return true

  end

end