local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

return {
  s({ trig = "clg", dscr = "Expand to console log" }, {
    t("console.log("),
    i(1),
    t(")"),
  }),
}
