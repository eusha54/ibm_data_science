import matplotlib.pyplot as plt
import matplotlib.colors as mcolors

# Define the color palettes
palettes2 = {
"Fresh and Modern": ['#4B0082', '#98FF98', '#FF4500'],
"Playful and Bright": ['#FF7F50', '#00FFFF', '#D3D3D3'],
"Bold and Energizing": ['#DC143C', '#9ACD32', '#333333'],
"Soft and Elegant": ['#FFC0CB', '#E6E6FA', '#D2B48C'],
"Sleek and Stylish": ['#6A5ACD', '#7FFF00', '#2F4F4F'],
"Warm and Inviting": ['#FF4500', '#F0E68C', '#A9A9A9']
}

palettes = {
"Soft and Elegant 1": ['#FFC0CB', '#8A2BE2', '#4B0082'],
"Soft and Elegant 2": ['#E6E6FA', '#2F4F4F', '#FFD700'],
"Soft and Elegant 2.1": ['#FFDAB9', '#2F4F4F', '#FFD700'],
"Soft and Elegant 3": ['#F8F8FF', '#556B2F', '#D2B48C'],
"Soft and Elegant 4": ['#FFB6C1', '#8B4513', '#F0E68C'],
"Soft and Elegant 5": ['#F5F5F5', '#4B0082', '#D2691E']

}



# Convert hex color codes to RGB format
def hex_to_rgb(hex_code):
    return mcolors.hex2color(hex_code)

# Create a plot to visualize the color palettes
fig, axes = plt.subplots(1, 6, figsize=(12, 2))

# Loop through each palette and plot it
for ax, (title, colors) in zip(axes, palettes.items()):
    rgb_colors = [hex_to_rgb(color) for color in colors]  # Convert hex to RGB
    ax.imshow([rgb_colors], aspect='auto')
    ax.set_title(title, fontsize=12, fontweight='bold')
    ax.axis('off')

plt.tight_layout()
plt.show()


