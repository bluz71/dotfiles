; inherits: ruby

(call
  method: (identifier) @_method
  arguments: (argument_list
               . (string
                   (string_content) @type)
               (_)*)
  (#eq? @_method "component")
  (#match? @type "^[A-Z][A-Za-z0-9]*(::[A-Z][A-Za-z0-9]*)*$"))
