local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

return {
  s({ trig = "php", dscr = "Expand to php expression" }, {
    t("<?php "),
    i(1),
    t("?>"),
  }),
}
