function _pr_nested(ast, lp, rp)
  local xs = {}
  for i, node in pairs(ast.value) do
      xs[#xs + 1] = pr_str(node)
  end
  return string.format('%s%s%s', lp, table.concat(xs, ' '), rp)
end

function pr_str(ast)
  if ast == nil then
    return ""
  end

  if ast.kind == "list" then
    return _pr_nested(ast, '(', ')')
  end

  if ast.kind == "vector" then
    return _pr_nested(ast, '[', ']')
  end

  if ast.kind == "string" then
    return string.format('"%s"', ast.value)
  end

  return tostring(ast.value)
end

return {
    pr_str = pr_str,
}
