import requests

url = "http://16.171.254.7:32444/"

try:
    response = requests.get(url, timeout=5)
    if response.status_code == 200:
        print("Application is UP ✅")
    else:
        print(f"Application is DOWN ❌, Status Code: {response.status_code}")
except requests.exceptions.RequestException as e:
    print(f"Application is DOWN ❌, Error: {e}")

