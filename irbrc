# Please install irbtools-more:
#
#   % gem install irbtools-more

require 'irbtools/more'

FancyIrb.start :colorize => {
    :input_prompt  => [:blue],
    :result_prompt => [:green],
    :irb_errors    => [:red],
    :stderr        => [:red],
    :stdout        => nil,
    :input         => nil,
}
IRB.conf[:SAVE_HISTORY] = 0
