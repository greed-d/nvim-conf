local function _1_()
  vim.g.nvlime_config = {
    arglist = { enabled = true },
    autodoc = { max_level = 5, max_lines = 50, enabled = false },
    cmp = { enabled = true },
    floating_window = { border = 'single', scroll_step = 3 },
    implementation = 'sbcl',
    leader = '<LocalLeader>',
    main_window = { position = 'right', size = '' },
    user_contrib_initializers = true,
  }
  return nil
end
return { 'monkoose/nvlime', dependencies = { 'monkoose/parsley' }, ft = { 'lisp' }, init = _1_ }
