require 'irbtools/more'

FancyIrb.start :colorize => {
    :input_prompt  => [:blue],
    :result_prompt => [:green],
    :irb_errors    => [:red],
    :stderr        => [:red],
    :stdout        => nil,
    :input         => nil,
  }
