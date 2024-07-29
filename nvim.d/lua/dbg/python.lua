-- TODO: figure out way to fetch/check if venv is activate (and if so use its bin/python)
--  ... otherwise use default /usr/bin/python3 

-- NOTE: create venv-dap to test with if it needs python3 from a specific VENV 
require('dap-python').setup('/usr/bin/python3')
