local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function pkg_name(_, parent, source)
    local env = parent.snippet.env
    local dot_path = string.gsub(env.RELATIVE_FILEPATH, "[/|\\]", ".")
    local dot_path_no_source = string.gsub(dot_path, source .. "%.", "")
    return string.gsub(dot_path_no_source, "%." .. env.TM_FILENAME, "")
end

local function class_name(_, parent, jtype)
    local env = parent.snippet.env
    return jtype .. " " .. env.TM_FILENAME_BASE
end

return {
    s(
        { trig = 'pkg', name = "package" },
        {
            t("package")
            , t(" ")
        , f(pkg_name, {}, {
            user_args = { "src.main.java" }
        })
        , t(";")
        }
    ),
    s(
        { trig = 'pclass', name = "publiclass" }
        , {
            t("public ")
            , f(class_name, {}, { user_args = { "class" } })
        , t("{")
        , i(1)
        , t("}")
        }
    )
    , s(
    { trig = 'pinterface', name = "publicinterface" }
    , {
        t("public ")
        , f(class_name, {}, { user_args = { "interface" } })
    , t("{")
    , i(1)
    , t("}")
    })
, s(
    { trig = 'precord', name = "publicrecord" }
    , {
        t("public ")
        , f(class_name, {}, { user_args = { "record" } })
    , t("()")
    , t("{")
    , i(1)
    , t("}")
    })

}
