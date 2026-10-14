local identifiers_known = {}
local anchors_linked = {}

local function warning_report(message)
  local file_name = pandoc.path.filename(quarto.doc.input_file)
  pandoc.log.warn(file_name .. ": " .. message)
end

local function identifier_record(element)
  if element.identifier ~= "" then
    identifiers_known[element.identifier] = true
  end
end

local function line_block_resembles_table(line_block)
  for _, line in ipairs(line_block.content) do
    if pandoc.utils.stringify(line):find("|", 1, true) then
      return true
    end
  end
  return false
end

local function code_block_class_is_braced(code_block)
  local class_first = code_block.classes[1]
  return class_first ~= nil and class_first:sub(1, 1) == "{"
end

local collector = {
  Header = identifier_record,
  Div = identifier_record,
  Span = identifier_record,
  Figure = identifier_record,
  Table = identifier_record,
  CodeBlock = function(code_block)
    identifier_record(code_block)
    if code_block_class_is_braced(code_block) then
      warning_report("Code block class " .. code_block.classes[1] .. " is neither a cell, a class, nor a raw block")
    end
  end,
  LineBlock = function(line_block)
    if line_block_resembles_table(line_block) then
      warning_report("Line block containing '|' is probably a table missing its separator row")
    end
  end,
  Link = function(link)
    local anchor = link.target:match("^#(.+)$")
    if anchor then
      table.insert(anchors_linked, anchor)
    end
  end,
}

function Pandoc(document)
  if document.meta.lint == false then
    return
  end
  document:walk(collector)
  for _, anchor in ipairs(anchors_linked) do
    if not identifiers_known[anchor] then
      warning_report("Link target #" .. anchor .. " does not exist in this document")
    end
  end
end
