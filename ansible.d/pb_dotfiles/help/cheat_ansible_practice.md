# ANSIBLE EXPLORATION/PRACTICE NOTES/CHEATSHEETS


Running "ping" command on hosts defined in custom inventory ("hosts.ini")

```
shelby-sensation@digitalocean-ubuntu-tor1-01
~/git/_ZLAB/zlab-ansible/playbook_dotfiles_test1 expr-dotfiles-test* 8m 7s
  ❯ ansible all -i hosts.ini -m ping -u root
ny3 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
66.228.40.141 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
newark1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
syd1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
170.64.151.189 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}

shelby-sensation@digitalocean-ubuntu-tor1-01
~/git/_ZLAB/zlab-ansible/playbook_dotfiles_test1 expr-dotfiles-test* 11s
  ❯
```

