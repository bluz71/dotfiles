require 'hirb'

Hirb.enable

old_print = Pry.config.print
Pry.config.print = proc do |*args|
  Hirb::View.view_or_page_output(args[1]) || old_print.call(*args)
end

Pry.prompt = [
  proc { |target_self, nest_level, pry|
        "[#{pry.input_array.size}]\001\e[0;34m\002#{Pry.config.prompt_name}\001\e[0m\002(\001\e[1;32m\002#{Pry.view_clip(target_self)}\001\e[0m\002)#{":#{nest_level}" unless nest_level.zero?}> "
       },
]
