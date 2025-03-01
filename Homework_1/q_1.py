import numpy as np
import time

# Generate numerical arrays
array = np.random.rand(1000, 1000)

# Save as text file
start_time = time.time()
np.savetxt('array.txt', array)
txt_save_time = time.time() - start_time

# Save as binary file
start_time = time.time()
np.save('array.npy', array)
binary_save_time = time.time() - start_time

# Read from text file
start_time = time.time()
array_from_txt = np.loadtxt('array.txt')
txt_read_time = time.time() - start_time

# Read from binary file
start_time = time.time()
array_from_binary = np.load('array.npy')
binary_read_time = time.time() - start_time

# Compare times
print(f"Time to save as text: {txt_save_time} seconds")
print(f"Time to save as binary: {binary_save_time} seconds")
print(f"Time to read from text: {txt_read_time} seconds")
print(f"Time to read from binary: {binary_read_time} seconds")