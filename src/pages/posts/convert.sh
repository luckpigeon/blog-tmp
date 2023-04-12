#!/bin/bash
# This script converts the original content format to the desired format
# Usage: bash convert.sh input_file output_file

# Check if the input and output files are provided
if [ $# -ne 2 ]; then
  echo "Please provide the input and output files as arguments."
  exit 1
fi

# Assign the input and output files to variables
input=$1
output=$2

# Read the original content from the input file
content=$(cat $input)

# Extract the values of the fields from the original content
title=$(echo "$content" | grep -oP '(?<=title: ).*')
date=$(echo "$content" | grep -oP '(?<=date: ).*')
tags=$(echo "$content" | grep -oP '(?<=tags: ).*')
top_img=$(echo "$content" | grep -oP '(?<=top_img: ).*')
cover=$(echo "$content" | grep -oP '(?<=cover: ).*')

# Write the desired format to the output file
cat > $output << EOF
layout: '../../layouts/MarkdownPost.astro'
title: '$title'
pubDate: '$date'
description: '$swiper_desc'
author: 'Bing'
cover:
    url: '$cover'
    square: '$top_img'
    alt: 'cover'
tags: $tags
theme: 'dark'
featured: true
EOF

# Print a success message
echo "Conversion done. Please check the output file for the result."