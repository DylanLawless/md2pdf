#!/bin/bash

# Check if input filename is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <input-markdown-file>"
    exit 1
fi

# Get the input file name and directory
input_file="$1"
input_dir=$(dirname "$input_file")
input_base=$(basename "$input_file" .md)

# Path to the template
template_path="$HOME/web/md2pdf/template.tex"

# Check if the template file exists
if [ ! -f "$template_path" ]; then
    echo "Template file not found at $template_path"
    exit 1
fi

# Get current date in YYYYMMDD format
current_date=$(date +%Y%m%d)

# Use supplied date if available
if [ "$2" ]; then
    current_date=$2
fi

# Format current_date to YYYYMMDD format
formatted_date=$(date -jf %Y%m%d "${current_date}" +%Y%m%d)

# Convert Markdown to PDF using pandoc with the custom template and formatted date
pandoc \
        "$input_file" \
        --template="$template_path" -s -V date="${formatted_date}" -o "${input_dir}/${input_base}_${current_date}.pdf"

# Open the generated PDF
open "${input_dir}/${input_base}_${current_date}.pdf"

# Ghostscript command to compress a PDF (currently commented out)
# gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -dPrinted=false -sOutputFile="${input_dir}/${input_base}-compressed.pdf" "${input_dir}/${input_base}_${current_date}.pdf"

