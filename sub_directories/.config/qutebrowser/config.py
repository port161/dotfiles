#settings
c.zoom.default=100
c.tabs.show = 'multiple'
c.tabs.select_on_remove = 'prev'
c.scrolling.smooth= True
c.url.start_pages='http://duckduckgo.com'
c.url.default_page='http://duckduckgo.com'
c.url.searchengines= {
		"DEFAULT": "https://duckduckgo.com/?q={}",
		"go": "https://www.google.co.uk/search?q={}",
		"yt": "https://www.youtube.com/results?search_query={}",
		"arch": "https://wiki.archlinux.org/?search={}",
		"w": "https://en.wikipedia.org/wiki/{}",
		"am": "https://duckduckgo.com/?q=!azuk {}",
		"eb": "https://duckduckgo.com/?q=!e.uk {}",
		}

#blocked sites
c.content.host_blocking.lists.append( str(config.configdir) + "/blockedHosts")

#bindings
config.unbind('J',mode='normal')
config.unbind('K',mode='normal')
config.unbind('j',mode='normal')
config.unbind('k',mode='normal')

config.bind('j','repeat 5 scroll down')
config.bind('k','repeat 5 scroll up')
config.bind('J','tab-prev')
config.bind('K','tab-next')
config.bind('x', 'tab-close')
config.bind('gJ', 'tab-move -')
config.bind('gK', 'tab-move +')
config.bind('gw', 'tab-give')
config.bind('t', 'set-cmd-text -s :open -t')
config.bind('w', 'set-cmd-text -s :open -w')
config.bind('W', 'set-cmd-text -s :open -p')

#Colors
#Tab Bar
c.colors.tabs.selected.even.bg = '#228da4'
c.colors.tabs.selected.odd.bg = '#228da4'
c.colors.tabs.selected.even.fg = '#ffff54'
c.colors.tabs.selected.odd.fg = '#ffff54'
c.colors.tabs.even.bg = '#132b13'
c.colors.tabs.odd.bg = '#132b13'
#search
c.colors.completion.even.bg = '#132b13'
c.colors.completion.odd.bg = '#132b13'
c.colors.completion.item.selected.bg = '#228da4'
c.colors.completion.item.selected.border.top= '#228da4'
c.colors.completion.item.selected.border.bottom= '#228da4'
c.colors.completion.item.selected.fg = '#ffff54'
c.colors.completion.category.bg = '#03994b'
c.colors.completion.category.fg = '#ffff54'
c.colors.completion.scrollbar.bg = '#132b13'
c.colors.completion.scrollbar.fg = '#ffff54'
#Status Bar
c.colors.statusbar.normal.bg = '#132b13'
c.colors.statusbar.caret.bg = '#132b13'
c.colors.statusbar.command.bg = '#132b13'
c.colors.statusbar.command.private.bg = '#132b13'
c.colors.statusbar.insert.bg = '#132b13'
c.colors.statusbar.private.bg = '#132b13'
c.colors.statusbar.progress.bg = '#132b13'
#Other
c.colors.prompts.bg = '#132b13'
c.colors.prompts.selected.bg = '#228da4'
c.colors.downloads.bar.bg = '#132b13'
c.colors.messages.info.bg = '#132b13'

#fonts
c.fonts.tabs.selected = '20pt Droid '
c.fonts.tabs.unselected = '20pt Droid '
c.fonts.completion.category = '20pt Droid '
c.fonts.completion.entry = '20pt Droid '
c.fonts.statusbar = '20pt Droid '
c.fonts.downloads = '20pt Droid '
c.fonts.hints = 'bold 20pt Droid '
c.fonts.keyhint = 'bold 20pt Droid '
c.fonts.messages.error = 'bold 20pt Droid '
c.fonts.messages.info = 'bold 20pt Droid '
c.fonts.prompts = 'bold 20pt Droid '
