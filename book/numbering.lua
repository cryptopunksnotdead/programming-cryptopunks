-- adjust as needed
-- turn off numbering for sections below max treshhold
local max_numbering_level = 1

function Header(h)
  if h.level > max_numbering_level then 
    h.classes:insert 'unnumbered'
  end
  return h
end

