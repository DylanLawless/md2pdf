# md2pdf  (Markdown to PDF)

`md2pdf` is a shell script that converts Markdown files to PDF using Pandoc with a custom LaTeX template. The generated PDF will be saved in the same directory as the input Markdown file, with a timestamp in the filename.

## quick install to ~/web/
Run:
`chmod +x ~/web/md2pdf.sh`

To you ~/.bash_profile (or other) add:
`alias md2pdf="$HOME/web/md2pdf/md2pdf.sh"`

Run:
`source ~/.bash_profile`

## Requirements

- Pandoc
- LaTeX (for Pandoc to generate PDFs)

## Installation

1. **Make the Script Executable:**

   ```sh
   chmod +x /path/to/md2pdf.sh
   ```

2. **Move the Script to a Directory in Your PATH:**

   ```sh
   sudo mv /path/to/md2pdf.sh /usr/local/bin/md2pdf
   ```

3. **Add Alias to `~/.bash_profile`:**

   Open your `~/.bash_profile` with a text editor:

   ```sh
   nano ~/.bash_profile
   ```

   Add the following line:

   ```sh
   alias md2pdf='/usr/local/bin/md2pdf'
   ```

   Save and exit the text editor. Then, reload the profile:

   ```sh
   source ~/.bash_profile
   ```

4. **Place the Template:**

   Ensure your LaTeX template is located at:

   ```sh
   ~/Library/Mobile Documents/com~apple~CloudDocs/md2pdf/template.tex
   ```

## Usage

To convert a Markdown file to PDF, use the following command:

```sh
md2pdf /path/to/your/markdownfile.md
```

The script will:

1. Check if the input filename is provided.
2. Get the input file name and directory.
3. Define the path to the LaTeX template.
4. Verify if the template file exists.
5. Get the current date in `YYYYMMDD` format or use a supplied date if provided.
6. Convert the Markdown file to PDF using Pandoc with the custom template and formatted date.
7. Open the generated PDF file.

### Example

```sh
md2pdf /Users/yourname/Documents/example.md
```

This command will generate a PDF file named `example_YYYYMMDD.pdf` in the same directory as the input Markdown file.

### Notes

- Ensure that Pandoc and LaTeX are installed on your system.
- Customize the path to the template if it is located in a different directory.
- The script opens the generated PDF file using the `open` command, which is suitable for macOS. Modify this command for compatibility with other operating systems.

