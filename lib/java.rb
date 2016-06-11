require_relative 'code'

class Java < Code

  def compile_user_code(user_submitted_code, mission_Obj, user_id)

    test_cases = TestCase.where(mission_id: mission_Obj.id)
    dir_path = Rails.root.join('tmp').to_s + '/' + user_id

    if Dir.exist? dir_path
      return check_with_test_cases(test_cases, user_submitted_code, dir_path)
    else
      Dir.mkdir dir_path
      return check_with_test_cases(test_cases, user_submitted_code, dir_path)
    end

  end



  def check_with_test_cases(test_cases,user_submitted_code, dir_path)

    test_cases.each do |tc|
      java_code = 'public class Code{
          ' + user_submitted_code + '

          public static void main(String args[]){

            Code c = new Code();
            ' + tc.return_type + ' x = c.' + tc.input + ';
            System.out.println(""+x);

          }
        }'

      Dir.chdir(dir_path) do

        my_file = File.new("Code.java", "w+")
        my_file.puts(java_code)
        my_file.close
        File.chmod(0755,"Code.java")
        stdin, stdout, stderr = Open3.popen3('javac Code.java')
        puts stderr.gets

        if File.exist?("Code.class")

          $result = `timeout 4s java Code`
          File.delete("Code.java") if File.exist?("Code.java")
          File.delete("Code.class") if File.exist?("Code.class")

          return false  if $result.chomp != tc.output

        else

          return false

        end

      end

    end

    return true

  end

end