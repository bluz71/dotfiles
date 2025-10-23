(((attribute_name) @_attr_name
  (#any-of? @_attr_name "x-data" "x-init" "x-if" "x-for" "x-effect"))
 .
 (quoted_attribute_value
   (attribute_value) @injection.content)
 (#set! injection.language "javascript"))

(((attribute_name) @_attr_name
  (#lua-match? @_attr_name "^@[a-z]"))
 .
 (quoted_attribute_value
   (attribute_value) @injection.content)
 (#set! injection.language "javascript"))

(((attribute_name) @_attr_name
  (#lua-match? @_attr_name "^:[a-z]"))
 .
 (quoted_attribute_value
   (attribute_value) @injection.content)
 (#set! injection.language "javascript"))
