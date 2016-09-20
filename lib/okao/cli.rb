require 'okao'
require 'thor'

module Okao
  class CLI < Thor
    OKAOS = ['(^-^)', '(´O`)', '(;-;)', '(´Д`)', '(｡-_-｡)', '(´･ω･`)', '(-_-;)', '(_ _)']

    desc 'to_okao [text][--file_path file_path]', 'Convert normal text to okao text'
    option :file_path
    def to_okao(text = nil)
      okao_init
      normal_text = load_file(options[:file_path])
      normal_text ||= text

      okao_text = Okao::Parser.to_okao(normal_text)
      puts okao_text
    end

    desc 'to_text [okao][--file_path file_path]', 'Convert okao text to normal text'
    option :file_path
    def to_text(okao = nil)
      okao_init
      okao_text = load_file(options[:file_path])
      okao_text ||= okao

      normal_text = Okao::Parser.to_text(okao_text)
      puts normal_text
    end

    desc 'exec [okao][--file_path file_path]', 'Execute okao script'
    option :file_path
    def exec(okao = nil)
      okao_init
      okao_text = load_file(options[:file_path])
      okao_text ||= okao

      code = okao_text.split("\n").reduce('') do |acc, cur|
        "#{acc}#{Okao::Parser.to_text(cur)}"
      end

      eval(code)
    end

    no_commands do
      def okao_init
        Okao::Emoticon.init(okaos)
      end

      def okaos
        OKAOS
      end

      def load_file(file_path)
        return if file_path.nil?
        File.open(file_path) do |file|
          file.read
        end
      end
    end
  end
end

