# FLAKE8: NOQA

c = get_config()

# c.TerminalIPythonApp.display_banner = True
# c.InteractiveShellApp.log_level = 20
# c.InteractiveShellApp.extensions = [
#     'myextension'
# ]
# c.InteractiveShellApp.exec_lines = [
#     # '%load_ext pyflyby',
#     # 'import json',
#     # 'import requests',
#     # 'import pandas as pd',
# ]
# c.InteractiveShellApp.exec_files = [
#     # 'mycode.py',
#     # 'fancy.ipy'
# ]
# c.InteractiveShell.autoindent = True
# c.InteractiveShell.colors = 'LightBG'
# c.InteractiveShell.confirm_exit = False
# c.InteractiveShell.deep_reload = False
# c.InteractiveShell.editor = 'vim'
# c.InteractiveShell.xmode = 'Context'

# c.PromptManager.in_template  = 'In [\#]: '
# c.PromptManager.in2_template = '   .\D.: '
# c.PromptManager.out_template = 'Out[\#]: '
# c.PromptManager.justify = True

c.PrefilterManager.multi_line_specials = True

c.AliasManager.user_aliases = [
 ('la', 'ls -al')
]
