set(SOURCE_FILES
    metadata.yaml
    Section_00_Foreword.md
    Section_01_Intro.md
    Section_02_IntelArch.md
    Section_03_00_WindowsIntel.md
    Section_03_01_WindowsStdCall.md
    Section_03_02_Windows64bit.md
    Section_04_00_LinuxIntel.md
    Section_04_01_LinuxGcc32bit.md
    Section_04_02_LinuxGcc64bit.md
)

add_document(
  TARGET CallingConventions_HTML
  OUTPUT_FILE CallingConventions.html
  SOURCES ${SOURCE_FILES}
  RESOURCE_FILES ${PROJECT_SOURCE_DIR}/cmake/pandoc.css ${PROJECT_SOURCE_DIR}/cmake/syntaxhighlight.theme
  RESOURCE_DIRS figures
  PANDOC_DIRECTIVES -t html
                    -f markdown
                    --toc
                    --self-contained
                    --number-sections
                    --toc-depth 3
                    --css pandoc.css
)
