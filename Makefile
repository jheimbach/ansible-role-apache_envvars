test1204:
	docker pull ubuntu:12.04
	docker build --rm=true --file=tests/Dockerfile.ubuntu-12.04 --tag=ubuntu-12.04:ansible tests
	docker run --detach --volume="${PWD}":/etc/ansible/roles/role_under_test:ro ${run_opts} ubuntu-12.04:ansible "/sbin/init" > container12.04
	docker exec --tty "$$(cat ./container12.04)" env TERM=xterm ansible-playbook /etc/ansible/roles/role_under_test/tests/test.yml --syntax-check
	docker exec --tty "$$(cat ./container12.04)" env TERM=xterm ansible-playbook /etc/ansible/roles/role_under_test/tests/test.yml -vvvv
	docker exec "$$(cat container12.04)" ansible-playbook /etc/ansible/roles/role_under_test/tests/test.yml | grep -q 'changed=0.*failed=0' && (echo 'Idempotence test: pass' && exit 0) || (echo 'Idempotence test: fail' && exit 0)

	docker pull ubuntu:12.04
	docker build --rm=true --file=tests/Dockerfile.apache.ubuntu-12.04 --tag=ubuntu-12.04:ansible tests
	docker run --detach --volume="${PWD}":/etc/ansible/roles/role_under_test:ro ${run_opts} ubuntu-12.04:ansible "/sbin/init" > apache.container12.04
	docker exec --tty "$$(cat ./apache.container12.04)" env TERM=xterm ansible-playbook /etc/ansible/roles/role_under_test/tests/test.yml --syntax-check
	docker exec --tty "$$(cat ./apache.container12.04)" env TERM=xterm ansible-playbook /etc/ansible/roles/role_under_test/tests/test.yml -vvvv
	docker exec "$$(cat apache.container12.04)" ansible-playbook /etc/ansible/roles/role_under_test/tests/test.yml | grep -q 'changed=0.*failed=0' && (echo 'Idempotence test: pass' && exit 0) || (echo 'Idempotence test: fail' && exit 0)

	docker stop "$$(cat apache.container12.04)"
	docker stop "$$(cat container12.04)"

	rm apache.container12.04
	rm container12.04
test1404:
	docker pull ubuntu:14.04
	docker build --rm=true --file=tests/Dockerfile.ubuntu-14.04 --tag=ubuntu-14.04:ansible tests
	docker run --detach --volume="${PWD}":/etc/ansible/roles/role_under_test:ro ${run_opts} ubuntu-14.04:ansible "/sbin/init" > container14.04
	docker exec --tty "$$(cat ./container14.04)" env TERM=xterm ansible-playbook /etc/ansible/roles/role_under_test/tests/test.yml --syntax-check
	docker exec --tty "$$(cat ./container14.04)" env TERM=xterm ansible-playbook /etc/ansible/roles/role_under_test/tests/test.yml -vvvv
	docker exec "$$(cat container14.04)" ansible-playbook /etc/ansible/roles/role_under_test/tests/test.yml | grep -q 'changed=0.*failed=0' && (echo 'Idempotence test: pass' && exit 0) || (echo 'Idempotence test: fail' && exit 0)

	docker pull ubuntu:14.04
	docker build --rm=true --file=tests/Dockerfile.apache.ubuntu-14.04 --tag=ubuntu-14.04:ansible tests
	docker run --detach --volume="${PWD}":/etc/ansible/roles/role_under_test:ro ${run_opts} ubuntu-14.04:ansible "/sbin/init" > apache.container14.04
	docker exec --tty "$$(cat ./apache.container14.04)" env TERM=xterm ansible-playbook /etc/ansible/roles/role_under_test/tests/test.yml --syntax-check
	docker exec --tty "$$(cat ./apache.container14.04)" env TERM=xterm ansible-playbook /etc/ansible/roles/role_under_test/tests/test.yml -vvvv
	docker exec "$$(cat apache.container14.04)" ansible-playbook /etc/ansible/roles/role_under_test/tests/test.yml | grep -q 'changed=0.*failed=0' && (echo 'Idempotence test: pass' && exit 0) || (echo 'Idempotence test: fail' && exit 0)

	docker stop "$$(cat apache.container14.04)"
	docker stop "$$(cat container14.04)"

	rm apache.container14.04
	rm container14.04

testAll: test1204 test1404
