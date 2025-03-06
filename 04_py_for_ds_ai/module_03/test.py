# using Try- except 
try:
    text = "example"
    length = len(text)  # No AttributeError, correct method usage
    missing = text.some_method()  # Raises AttributeError
except ZeroDivisionError:
    # Handling the ZeroDivisionError and printing an error message
    print("Error: Cannot divide by zero")
# This line will be executed regardless of whether an exception occurred
print("outside of try and except block")