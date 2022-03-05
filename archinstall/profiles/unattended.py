import time import archinstall

archinstall.log("Hello Stinky!")

archinstall.store["UPSTREAM_URL"] = "https://raw.githubusercontent.com/Jonnobrow/dotfiles/archinstall/profiles"
archinstall.store["PROFILE_DB"] = "index.json"

print(archinstall.store)
print(archinstall.list_profiles())

for name, info in archinstall.list_profiles().items():
	# Tailored means it's a match for this machine
	# based on it's MAC address (or some other criteria
	# that fits the requirements for this machine specifically).
	if info['tailored']:
		print(f'Found a tailored profile for this machine called: "{name}".')
		print('Starting install in:')
		for i in range(10, 0, -1):
			print(f'{i}...')
			time.sleep(1)
		profile = archinstall.Profile(None, info['path'])
		profile.install()
		break
