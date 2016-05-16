require 'hirb'

# Enable Hirb for nicer object display, especially table-based objects.
#
Hirb.enable
old_print = Pry.config.print
Pry.config.print = proc do |*args|
  Hirb::View.view_or_page_output(args[1]) || old_print.call(*args)
end

# Change prompt color from gray to blue:green.
#
Pry.prompt = [
  proc { |target_self, nest_level, pry|
        "[#{pry.input_array.size}]\001\e[0;34m\002#{Pry.config.prompt_name}\001\e[0m\002(\001\e[1;32m\002#{Pry.view_clip(target_self)}\001\e[0m\002)#{":#{nest_level}" unless nest_level.zero?}> "
       },
]

# Change String color from ugly red to nicer purple.
#
# Full list of default colors used by Pry:
#  https://github.com/rubychan/coderay/blob/master/lib/coderay/encoders/terminal.rb
CodeRay.scan("example", :ruby).term

TERM_TOKEN_COLORS = {
  :string => {
    :self => "\e[35m",
    :modifier => "\e[1;35m",
    :char => "\e[1;35m",
    :delimiter => "\e[1;35m",
    :escape => "\e[1;34m",
  }
}

module CodeRay
  module Encoders
    class Terminal < Encoder
      # Override old colors
      TERM_TOKEN_COLORS.each_pair do |key, value|
        TOKEN_COLORS[key] = value
      end
    end
  end
end

# Setup aliases.
#
Pry.commands.alias_command 'b', 'break'
Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 'f', 'finish'
Pry.commands.alias_command 'n', 'next'
Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'src', 'show-source'
