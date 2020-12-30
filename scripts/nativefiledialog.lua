project "nativefiledialog"
	kind "StaticLib"
	windowstargetplatformversion("10.0")

	includedirs {
		path.join(SOURCE_DIR, "nativefiledialog/src/include"),
		path.join(SOURCE_DIR, "nativefiledialog/src")
	}

	files {
		path.join(SOURCE_DIR, "nativefiledialog/src/nfd_common.c"),
	}

	configuration { "VS20*" }
	files {
		path.join(SOURCE_DIR, "nativefiledialog/src/nfd_win.cpp"),
	}

	configuration { "xcode* or osx*" }
	files {
		path.join(SOURCE_DIR, "nativefiledialog/src/nfd_cocoa.m"),
	}

	configuration { "linux*" }
	includedirs {
		path.join(SOURCE_DIR, "/usr/include/gtk-3.0"),	
		path.join(SOURCE_DIR, "/usr/include/glib-2.0"),
		path.join(SOURCE_DIR, "/usr/include/pango-1.0"),
		path.join(SOURCE_DIR, "/usr/include/harfbuzz"),
		path.join(SOURCE_DIR, "/usr/include/cairo"),	  
		path.join(SOURCE_DIR, "/usr/include/gdk-pixbuf-2.0"),
		path.join(SOURCE_DIR, "/usr/include/atk-1.0"),
		path.join(SOURCE_DIR, "/usr/lib/x86_64-linux-gnu/glib-2.0/include"),
	}
	files {
		path.join(SOURCE_DIR, "nativefiledialog/src/nfd_gtk.c"),
	}

	configuration {}
