module Okao
  class Parser
    class << self
      def to_okao(text)
        lines = text.split("\n")
        lines.reduce('') do |acc, cur|
          points = cur.codepoints.map { |c| c.to_s(8).to_i }
          okaos = points.map do |point|
            face_list = format('%06d', point.to_s).split('').map do |i|
              Okao::Emoticon.send("face#{i}")
            end

            face_list.join
          end

          "#{acc}#{okaos.join}\n"
        end
      end

      def to_text(okao_line)
        okao_hash = Okao::Emoticon.to_h.invert
        numbers = okao_line.gsub(/\(.*?\)/) do |m|
          var_name = okao_hash[m]
          var_name.slice(/\d/)
        end
        
        normal_text = numbers.gsub(/\d{6}/) do |n|
          n.to_i(8).chr('UTF-8')
        end

        "#{normal_text}\n"
      end
    end
  end
end

