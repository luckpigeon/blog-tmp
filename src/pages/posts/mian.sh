# Create the output folder if it does not exist
mkdir -p output

# Loop through each file in the input folder
for file in input/*; do
  # Get the file name without the extension
  name=$(basename $file .md)

  # Call the convert script with the input and output files
  bash convert.sh $file output/$name.md
done