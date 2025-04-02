# Read the URLs from the file 'repos.md'
with open("repos.md", "r") as file:
    urls = [line.strip() for line in file if line.strip()]

print(urls)

# Iterate over the list and transform each URL by wrapping it in single quotes and appending a comma.
transformed = "\n".join([f"'{url}'," for url in urls])

# Write the transformed content to a file.
with open("transformed_urls.txt", "w", encoding="utf-8") as file:
    file.write(transformed)

print("File 'transformed_urls.txt' has been created successfully!")