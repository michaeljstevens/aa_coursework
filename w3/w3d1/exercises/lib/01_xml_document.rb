require 'byebug'
class XmlDocument
  def initialize(indent = false)
    @indent = indent
    @indent_size = -1
  end

  def method_missing(method_name, *args, &block)
    arg = args.first || {}
    method_name = method_name.to_s
    xml_string = ""
    if @indent
      if block_given?
        xml_string << "#{indent_string}<#{method_name}>\n#{block.call}#{deindent_string}</#{method_name}>\n"
      elsif arg != {}
        xml_string << "#{indent_string}<#{method_name} #{arg_string(method_name, arg)}/>\n"
      else
        xml_string << "#{indent_string}<#{method_name}/>\n"
      end
    else
      if block_given?
        xml_string << "<#{method_name}>#{block.call}</#{method_name}>"
      elsif arg != {}
        xml_string << "<#{method_name} #{arg_string(method_name, arg)}/>"
      else
        xml_string << "<#{method_name}/>"
      end
    end
    xml_string
  end

  def value_string(arg)
    arg.map do |key, value|
      "#{key.to_s}=\"#{value}\""
    end
  end

  def arg_string(method_name, arg)
    (value_string(arg)).join(" ")
  end

  def indent_string
    indent = ""
    @indent_size += 1
    @indent_size.times {indent << "  "}
    indent
  end

  def deindent_string
    indent = ""
    @indent_size -= 1
    @indent_size.times {indent << "  "}
    indent
  end
end

xml = XmlDocument.new(true)

xml_string = xml.hello do
  xml.this do
    xml.is do
      xml.a do
        xml.deeply do
          xml.nested do
            xml.string do
              xml.hope(this: "works")
            end
          end
        end
      end
    end
  end
end

puts xml_string
