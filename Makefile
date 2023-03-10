apply:
	devenv shell -- ansible-playbook --vault-password-file ~/.ansible_vault_password.txt --ask-become-pass main.yml

deps:
	devenv shell -- ansible-galaxy install --role-file=requirements.yml

deps-py-gen:
	devenv shell -- pipx run --spec pip-tools pip-compile --verbose --upgrade --resolver=backtracking --output-file=requirements-py/requirements-py-dev.txt requirements-py/requirements-py-dev.in

venv:
	devenv shell -- python3 -m venv .venv

create:
	devenv shell -- ansible-vault create files/id_ed25519

edit:
	devenv shell -- ansible-vault edit files/id_ed25519

copy-keys:
	scp /root/.ssh/id_ed25519.pub root-fm1395-rsync-net:.ssh/authorized_keys

backup:
	sudo /root/backups/backup.sh
