class Compiler

  def self.compile_user_code (submitted_code)
    test_cases.each do |tc|

      java_code = 'public class Code{

          ' + submitted_code + '

          public static void main(String args[]){

            Code c = new Code();
            int x = c.' + tc.input + ';
            System.out.println(""+x);

          }
        }'

      my_file = File.new("Code.java", "w+")
      my_file.puts(java_code)
      my_file.close
      File.chmod(0777,"Code.java")
      stdin, stdout, stderr = Open3.popen3('javac Code.java')

      puts stderr.gets
      $result = `timeout 4s java Code`

      if $result.chomp != tc.output
        render :json =>  {'output':'Failure'}
        return
      end

      File.delete("Code.java")
      File.delete("Code.class")

    end

  end

end