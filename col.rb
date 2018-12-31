# _plugins/col.rb
module Jekyll
  module Tags
    class ColTag < Liquid::Block

      def initialize(tag_name, input, tokens)
        super
        @input = input
      end

      def render(context)

        begin
          if( !@input.nil? && !@input.empty? )
            if( @input.include? "|")

              input_split = split_params(@input)

              classstring = "class=\"elem col #{input_split[0].strip}\""
              imgstring = "style=\"background-image: url(/assets/images/#{input_split[1].strip})\""

            else

              classstring = "class=\"elem col #{@input}\""

            end
          end
          rescue
        end

        site = context.registers[:site]
        converter = site.find_converter_instance(::Jekyll::Converters::Markdown)
        output = converter.convert(super(context))

        # Input in this format: {# col classnames | background-image (in assets folder) #}
        "<div #{classstring} #{imgstring}>#{output}</div>"
      end

      def split_params(params)
        params.split("|")
      end

    end
  end
end

Liquid::Template.register_tag('col', Jekyll::Tags::ColTag)
