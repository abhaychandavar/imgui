project "ImGui"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"

    targetdir ("bin/" .. outputDir)
    objdir    ("bin-int/" .. outputDir)

    includedirs { ".", "backends" }

    files {
        "imconfig.h",
        "imgui.h",
        "imgui.cpp",
        "imgui_draw.cpp",
        "imgui_internal.h",
        "imgui_tables.cpp",
        "imgui_widgets.cpp",
        "imstb_rectpack.h",
        "imstb_textedit.h",
        "imstb_truetype.h",
    }

    filter "system:windows"
        files {
            "backends/imgui_impl_win32.h",
            "backends/imgui_impl_win32.cpp",
            "backends/imgui_impl_dx11.h",
            "backends/imgui_impl_dx11.cpp",
            "backends/imgui_impl_opengl3.h",
            "backends/imgui_impl_opengl3.cpp",
            "backends/imgui_impl_opengl3_loader.h",
        }
        defines { "_CRT_SECURE_NO_WARNINGS" }

    filter "system:macosx"
        files {
            "backends/imgui_impl_opengl3.h",
            "backends/imgui_impl_opengl3.cpp",
            "backends/imgui_impl_opengl3_loader.h",
        }

    filter "system:linux"
        files {
            "backends/imgui_impl_opengl3.h",
            "backends/imgui_impl_opengl3.cpp",
            "backends/imgui_impl_opengl3_loader.h",
        }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"

    filter {}
