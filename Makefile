stow:
	stow --verbose --target ~ emacs
unstow:
	stow --verbose --delete --target ~ emacs
restow:
	stow --verbose --restow --target ~ emacs
download-freecad-macros:
	wget -P freecad/.local/share/FreeCAD/Macro "https://github.com/mwganson/pdwrapper/blob/main/pdwrapper.FCMacro"
