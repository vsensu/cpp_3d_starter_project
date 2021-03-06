add_requires("conan::glfw/3.3.2", {alias = "glfw"})
add_requires("conan::glm/0.9.9.8", {alias = "glm"})
add_requires("conan::imgui/1.78", {alias = "imgui"})

target("cpp_3d_starter_project")
    set_kind("binary")
    set_languages("c99", "c++20")
    add_includedirs("deps/glad/include")
    add_includedirs("deps/imgui/platforms/include")
    add_files("deps/**/*.cpp")
    add_files("deps/**/*.c")
    add_files("src/**/*.cpp")
    add_files("src/*.cpp")
    if is_plat("windows") then 
        add_ldflags("-subsystem:windows", "-entry:mainCRTStartup", {force = true}) 
        add_links("user32", "gdi32", "shell32")
    end
    add_packages("glfw", "glm", "imgui")
