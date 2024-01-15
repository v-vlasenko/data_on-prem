import requests
import time

url = "your_url_here"
bearer_token = "your_bearer_token_here"

headers = {
    "Authorization": f"Bearer {bearer_token}",
    "Prefer": "profile=internal",
    "Accept": "application/vnd.api+json"
}

while True:
    try:
        response = requests.get(url, headers=headers)
        response_data = response.json()

        # Check if "status" is "setup_complete" in the response
        if response_data.get("data", {}).get("attributes", {}).get("status") == "setup_complete":
            print("Setup is complete. Exiting.")
            break

        # Wait for one second before the next request
        time.sleep(1)

    except Exception as e:
        print(f"Error: {e}")
        # Handle the error if needed
        # You might want to add some retry logic or exit the script based on your requirements
        break