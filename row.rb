# _plugins/row.rb
module Jekyll
  module Tags
    class RowTag < Liquid::Block

      def initialize(tag_name, input, tokens)
        super
        @input = input
      end

      def render(context)

        begin
          if( !@input.nil? && !@input.empty? )
            if( @input.include? "|")

              input_split = split_params(@input)

              idstring = "id=\"#{input_split[0].strip}\""
              classstring = "class=\"#{input_split[1].strip}\""
              imgstring = "style=\"background-image: url(/assets/images/#{input_split[2].strip})\""

            else

              idstring = "id=\"#{@input}\""

            end
          end
          rescue
        end

        site = context.registers[:site]
        converter = site.find_converter_instance(::Jekyll::Converters::Markdown)
        output = converter.convert(super(context))

        # input in this format: {% row id | classnames | background-image (in assets folder) %}
        "<div #{idstring} #{classstring} #{imgstring}><div class=\"row\">#{output}</div></div>"
      end

      def split_params(params)
        params.split("|")
      end

    end
  end
end

Liquid::Template.register_tag('row', Jekyll::Tags::RowTag)
