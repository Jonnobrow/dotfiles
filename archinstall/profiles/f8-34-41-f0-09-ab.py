import archinstall

# Packages not for laptop only
__packages__ = []


if __name__ == "f8-34-41-f0-09-ab":
    archinstall.storage['installation_session'].add_additional_packages(__packages__)
    archinstall.storage['installation_session'].install_profile("base")

