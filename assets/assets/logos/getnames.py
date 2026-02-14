import os

# Path to your logos folder
directory = "."

# Valid image extensions
valid_exts = ('.png', '.jpg', '.jpeg', '.webp', '.gif', '.bmp', '.svg')

# Get list of image paths
image_list = [
    os.path.join(directory, filename).replace("\\", "/")  # normalize path
    for filename in os.listdir(directory)
    if filename.lower().endswith(valid_exts)
]

# Output Flutter-compatible list
flutter_list = ',\n  '.join([f"'{path}'" for path in image_list])
print("Flutter image list:\n[\n  " + flutter_list + "\n]")
