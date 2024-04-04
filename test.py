import base64

def decode_base64_all_encodings(base64_string):
    # List of encodings to try
    encodings = ["utf-8", "utf-16", "utf-16le", "utf-16be", "utf-32", "utf-32le", "utf-32be",
                 "ascii", "latin1", "iso-8859-1", "iso-8859-15"]

    # Decoding the base64 string
    base64_bytes = base64.b64decode(base64_string)

    # Trying to decode with different encodings
    results = {}
    for encoding in encodings:
        try:
            decoded_text = base64_bytes.decode(encoding)
            results[encoding] = decoded_text
        except UnicodeDecodeError:
            results[encoding] = "Decoding error"

    return results

# Example usage
base64_string = "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"  # Replace this with your base64 string
base64_string = "SgWrFHzZGrt+dz9K0FIu3Q=="
decoded_results = decode_base64_all_encodings(base64_string)
for encoding, result in decoded_results.items():
    print(f"{encoding}: {result}")
