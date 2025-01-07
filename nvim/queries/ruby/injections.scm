((call
  method: (identifier) @method
  (#eq? @method "erb_template"))
  .
  (heredoc_body
    (heredoc_content) @injection.content)
  (#set! injection.language "embedded_template"))
