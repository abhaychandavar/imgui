project "ImGui"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"

    targetdir ("bin/" .. outputDir)
    objdir    ("bin-int/" .. outputDir)

    includedirs { ".", "backends", "../GLFW/include" }

    files {
        "imconfig.h",
        "imgui.h",
        "imgui.cpp",
        "imgui_draw.cpp",
        "imgui_demo.cpp",
        "imgui_internal.h",
        "imgui_tables.cpp",
        "imgui_widgets.cpp",
        "imstb_rectpack.h",
        "imstb_textedit.h",
        "imstb_truetype.h",
        "backends/imgui_impl_glfw.h",
        "backends/imgui_impl_glfw.cpp",
        "backends/imgui_impl_opengl3.h",
        "backends/imgui_impl_opengl3.cpp",
        "backends/imgui_impl_opengl3_loader.h",
    }

    filter "system:windows"
        files {
            "backends/imgui_impl_win32.h",
            "backends/imgui_impl_win32.cpp",
            "backends/imgui_impl_dx11.h",
            "backends/imgui_impl_dx11.cpp",
        }
        defines { "_CRT_SECURE_NO_WARNINGS", "GLFW_INCLUDE_NONE" }

    filter "system:macosx"
        defines { "GLFW_INCLUDE_NONE" }

    filter "system:linux"
        defines { "GLFW_INCLUDE_NONE" }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"

    filter {}
