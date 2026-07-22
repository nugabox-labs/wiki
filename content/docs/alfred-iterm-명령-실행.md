+++
title = "Alfred iTerm 명령 실행"
date = 2021-07-30T05:27:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "TECH"]
tags = ["MACOS", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "11e5c864-fe4f-40cd-9302-b92e2c9fadc3"
notion_url = "https://app.notion.com/p/Alfred-iTerm-11e5c864fe4f40cd9302b92e2c9fadc3"
external_url = "https://nesoy.github.io/articles/2019-07/Alfred-iterm"
+++

## Alfred → iTerm AppleScript

Alfred Custom Script (iTerm 2.9+):

```javascript
on alfred_script(q)
	if application "iTerm2" is running or application "iTerm" is running then
		run script "
			on run {q}
				tell application \":Applications:iTerm.app\"
					activate
					try
						select first window
						set onlywindow to false
					on error
						create window with default profile
						select first window
						set onlywindow to true
					end try
					tell the first window
						if onlywindow is false then
							create tab with default profile
						end if
						tell current session to write text q
					end tell
				end tell
			end run
		" with parameters {q}
	else
		run script "
			on run {q}
				tell application \":Applications:iTerm.app\"
					activate
					try
						select first window
					on error
						create window with default profile
						select first window
					end try
					tell the first window
						tell current session to write text q
					end tell
				end tell
			end run
		" with parameters {q}
	end if
end alfred_script
```

Ref: [https://github.com/stuartcryan/custom-iterm-applescripts-for-alfred/](https://github.com/stuartcryan/custom-iterm-applescripts-for-alfred/)
