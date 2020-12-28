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

   configuration {}
