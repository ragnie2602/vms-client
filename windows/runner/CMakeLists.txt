cmake_minimum_required(VERSION 3.14)
project(runner LANGUAGES CXX)

# Define the application target. To change its name, change BINARY_NAME in the
# top-level CMakeLists.txt, not the value here, or `flutter run` will no longer
# work.
#
# Any new source files that you add to the application should be added here.
add_executable(${BINARY_NAME} WIN32
  "flutter_window.cpp"
  "main.cpp"
  "utils.cpp"
  "win32_window.cpp"
  "${FLUTTER_MANAGED_DIR}/generated_plugin_registrant.cc"
  "Runner.rc"
  "runner.exe.manifest"
  "../ffmpeg_job_object.cpp"
)

# Apply the standard set of build settings. This can be removed for applications
# that need different build settings.
apply_standard_settings(${BINARY_NAME})

# Add preprocessor definitions for the build version.
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION=\"${FLUTTER_VERSION}\"")
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION_MAJOR=${FLUTTER_VERSION_MAJOR}")
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION_MINOR=${FLUTTER_VERSION_MINOR}")
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION_PATCH=${FLUTTER_VERSION_PATCH}")
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION_BUILD=${FLUTTER_VERSION_BUILD}")

# Disable Windows macros that collide with C++ standard library functions.
target_compile_definitions(${BINARY_NAME} PRIVATE "NOMINMAX")

# Add dependency libraries and include directories. Add any application-specific
# dependencies here.
target_link_libraries(${BINARY_NAME} PRIVATE flutter flutter_wrapper_app)
target_link_libraries(${BINARY_NAME} PRIVATE "dwmapi.lib")
target_include_directories(${BINARY_NAME} PRIVATE "${CMAKE_SOURCE_DIR}")

# Run the Flutter tool portions of the build. This must not be removed.
add_dependencies(${BINARY_NAME} flutter_assemble)

# ============================================================
# 📄 Auto-copy ffmpeg.exe vào folder cài đặt của app
# ============================================================

set(FFMPEG_SOURCE_PATH "${CMAKE_CURRENT_LIST_DIR}/../../ffmpeg/ffmpeg.exe")

if(NOT EXISTS ${FFMPEG_SOURCE_PATH})
    message(FATAL_ERROR
        "❌ ERROR: ffmpeg.exe not found at:\n"
        "   ${FFMPEG_SOURCE_PATH}\n"
        "   → Place ffmpeg.exe in: <project_root>/ffmpeg/ffmpeg.exe"
    )
endif()

add_custom_command(
    TARGET ${BINARY_NAME}
    POST_BUILD

    COMMAND ${CMAKE_COMMAND} -E echo "📦 Copying ffmpeg.exe to: $<TARGET_FILE_DIR:${BINARY_NAME}>"
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
            "${FFMPEG_SOURCE_PATH}"
            "$<TARGET_FILE_DIR:${BINARY_NAME}>/ffmpeg.exe"

    COMMENT "📌 Attaching ffmpeg.exe after build"
)

# ============================================================
# 📄 Auto-copy ffmpeg_watchdog.exe vào folder cài đặt của app
# ============================================================

set(WATCHDOG_SOURCE_PATH "${CMAKE_CURRENT_LIST_DIR}/../../ffmpeg/ffmpeg_watchdog.exe")

if(NOT EXISTS ${WATCHDOG_SOURCE_PATH})
    message(FATAL_ERROR
        "❌ ERROR: ffmpeg_watchdog.exe not found at:\n"
        "   ${WATCHDOG_SOURCE_PATH}\n"
        "   → Place ffmpeg_watchdog.exe in: <project_root>/ffmpeg/ffmpeg_watchdog.exe"
    )
endif()

add_custom_command(
    TARGET ${BINARY_NAME}
    POST_BUILD

    COMMAND ${CMAKE_COMMAND} -E echo "📦 Copying ffmpeg_watchdog.exe to: $<TARGET_FILE_DIR:${BINARY_NAME}>"
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
            "${WATCHDOG_SOURCE_PATH}"
            "$<TARGET_FILE_DIR:${BINARY_NAME}>/ffmpeg_watchdog.exe"

    COMMENT "📌 Attaching ffmpeg_watchdog.exe after build"
)

# ============================================================
# 📄 Auto-copy config.ini vào folder cài đặt của app
# ============================================================

# Đường dẫn tới file config.ini ở ngoài cùng project (cùng cấp pubspec.yaml)
set(CONFIG_SOURCE_PATH "${CMAKE_CURRENT_LIST_DIR}/../../config.ini")

# Kiểm tra file tồn tại
if(NOT EXISTS ${CONFIG_SOURCE_PATH})
    message(WARNING
        "⚠️  WARNING: config.ini not found at:\n"
        "   ${CONFIG_SOURCE_PATH}\n"
        "   → Place config.ini in project root"
    )
else()
    add_custom_command(
        TARGET ${BINARY_NAME}
        POST_BUILD

        # Copy file config.ini
        COMMAND ${CMAKE_COMMAND} -E echo "📦 Copying config.ini to: $<TARGET_FILE_DIR:${BINARY_NAME}>"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
                "${CONFIG_SOURCE_PATH}"
                "$<TARGET_FILE_DIR:${BINARY_NAME}>/config.ini"

        COMMENT "📌 Attaching config.ini after build"
    )
endif()
