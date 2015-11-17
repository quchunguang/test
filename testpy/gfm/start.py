#!/bin/env python2
# sudo pip install py-gfm bleach

import markdown
import bleach

untrusted_text = '#Header 1\n* item 1\n*item 2\n\n'
html = bleach.clean(markdown.markdown(untrusted_text))

md = markdown.Markdown(safe_mode='replace',
                       html_replacement_text='--RAW HTML NOT ALLOWED--')

print md
