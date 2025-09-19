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

  s({ trig = "log", dscr = "Expand to console log" }, {
    t("console.log("),
    i(1),
    t(")"),
  }),

  s({ trig = "if", dscr = "If statements" }, {
    -- line 1
    t("<?php if ("),
    i(1),
    t({ ") { ?>", "  " }),
    -- line 2
    i(2),
    i(0),
    -- line 3
    t({ "", "<?php } ?>" }),
  }),

  s({ trig = "ife", dscr = "If else statements" }, {
    -- line 1
    t("<?php if ("),
    i(1),
    t({ ") { ?>", "  " }),
    -- line 2
    i(2),
    i(0),
    -- line 3
    t({ "", "<?php } else {?>" }),
    -- line 4
    t({ "", "  " }),
    i(3),
    -- line 5
    t({ "", "<?php } ?>" }),
  }),

  -- foreach
  --  <?php foreach($column as $row) { ?>
  --  <?php } ?>
  s(
    { trig = "for", dscr = "Foreach loops" },
    fmt(
      "<?php foreach([] as []) { ?>\n  []\n<?php } ?>",
      { i(1, "items"), i(2, "item"), i(0, "loop content") },
      { delimiters = "[]" }
    )
  ),
}
