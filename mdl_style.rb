# Markdown Lint Rules:
#   https://github.com/markdownlint/markdownlint/blob/master/docs/RULES.md

all
rule 'MD029', :style => :ordered
exclude_rule 'MD013' # disable line length limit
exclude_rule 'MD024' # allow multiple headings with the same comment
exclude_rule 'MD030' # allow spaces after list markers
exclude_rule 'MD033' # allow inline HTML
exclude_rule 'MD040' # allow code blocks without language specification
