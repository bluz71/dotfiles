local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

npairs.setup({
  disable_filetype = { "text", "txt" },
  ignored_next_char = [=[[%w%%%'%(%[%{%"%.%`%$%,%/%■]]=],
})

npairs.add_rules({
  Rule("|", "|", { "ruby" }):with_move(cond.done()),
  -- Close eRuby delimiters.
  Rule("<%", " %>", { "eruby" }):with_move(cond.done()),
  Rule("<!--", " -->", { "eruby" }):with_move(cond.done()),
  -- Close common HTML tags similar to nvim-ts-autotag plugin.
  Rule("<a>", "</a>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<article>", "</article>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<aside>", "</aside>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<blockquote>", "</blockquote>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<button>", "</button>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<div>", "</div>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<em>", "</em>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<footer>", "</footer>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<form>", "</form>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<h1>", "</h1>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<h2>", "</h2>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<h3>", "</h3>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<h4>", "</h4>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<header>", "</header>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<label>", "</label>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<li>", "</li>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<main>", "</main>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<nav>", "</nav>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<ol>", "</ol>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<option>", "</option>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<p>", "</p>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<pre>", "</pre>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<section>", "</section>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<select>", "</select>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<small>", "</small>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<span>", "</span>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<strong>", "</strong>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<table>", "</table>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<tbody>", "</tbody>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<td>", "</td>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<textarea>", "</textarea>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<th>", "</th>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<thead>", "</thead>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<tr>", "</tr>", { "eruby", "html" }):with_move(cond.done()),
  Rule("<ul>", "</ul>", { "eruby", "html" }):with_move(cond.done()),
})

-- Auto-complete LSP function & method parentheses via nvim-cmp plugin.
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
