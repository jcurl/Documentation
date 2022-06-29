set(SOURCE_FILES
    CodingStandards.xml
    CodingStandardsExport.xml
)

add_document(
  TARGET CodingStandards_HTML
  OUTPUT_FILE CodingStandards.html
  SOURCES ${SOURCE_FILES}
  RESOURCE_FILES ${PROJECT_SOURCE_DIR}/cmake/pandoc.css ${PROJECT_SOURCE_DIR}/cmake/syntaxhighlight.theme
  PANDOC_DIRECTIVES -t html
                    -f docbook
                    --toc
                    --self-contained
                    --number-sections
                    --toc-depth 3
                    --css pandoc.css
)
