local function shift_headings_in_blocks(blocks, shift)
  for _, block in ipairs(blocks) do
    if block.t == "Header" then
      block.level = math.min(block.level + shift, 6)
    elseif block.t == "Div" or block.t == "BlockQuote" then
      block.content = shift_headings_in_blocks(block.content, shift)
    elseif block.t == "BulletList" or block.t == "OrderedList" then
      for _, item in ipairs(block.content) do
        shift_headings_in_blocks(item, shift)
      end
    end
  end
  return blocks
end

function Div(el)
  if el.classes:includes("shift-headings") then
    el.content = shift_headings_in_blocks(el.content, 1)
    return el
  end
end
