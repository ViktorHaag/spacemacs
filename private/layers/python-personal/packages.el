;;; packages.el --- python-personal layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2019 Sylvain Benner & Contributors
;;
;; Author: Viktor Haag <viktor.haag@gmail.com>
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary: personal modifications for python layer from base distribution

;;; Code:

(setq python-personal-packages
  '(
    elpy
    (pip-decorate :location local)
    python-mode
    ))

(defun python-personal/init-python-mode ()
  (use-package python-mode
    :mode "\\.py\\'"
    :interpreter "python3"
    :init
    (progn
      (setq py-shell-name "python3")
      (setq python-shell-interpreter (expand-file-name "~/.pyenv/shims/python3" ))
    )))


(defun python-personal/init-elpy ()
  (use-package elpy
    :init
    (progn
      (setq elpy-rpc-python-command (expand-file-name "~/.pyenv/shims/python3"))
      (setq elpy-rpc-virtualenv-path 'current)
      (setq elpy-config--get-config "import json
import sys
# from distutils.version import LooseVersion
from packaging.version import Version as LooseVersion
import warnings
warnings.filterwarnings('ignore', category=FutureWarning)

try:
    import urllib2 as urllib
except ImportError:
    import urllib.request as urllib


# Check if we can connect to pypi quickly enough
try:
    response = urllib.urlopen('https://pypi.org/pypi', timeout=1)
    CAN_CONNECT_TO_PYPI = True
except:
    CAN_CONNECT_TO_PYPI = False


def latest(package, version=None):
    if not CAN_CONNECT_TO_PYPI:
        return None
    try:
        response = urllib.urlopen('https://pypi.org/pypi/{package}/json'.format(package=package),
               timeout=2).read()
        latest = json.loads(response)['info']['version']
        if version is None or LooseVersion(version) < LooseVersion(latest):
            return latest
        else:
            return None
    except:
        return None


config = {}
config['can_connect_to_pypi'] = CAN_CONNECT_TO_PYPI
config['rpc_python_version'] = ('{major}.{minor}.{micro}'
                            .format(major=sys.version_info[0],
                                    minor=sys.version_info[1],
                                    micro=sys.version_info[2]))

try:
    import elpy
    config['elpy_version'] = elpy.__version__
except:
    config['elpy_version'] = None

try:
    import jedi
    if isinstance(jedi.__version__, tuple):
        config['jedi_version'] = '.'.join(str(x) for x in jedi.__version__)
    else:
        config['jedi_version'] = jedi.__version__
    config['jedi_latest'] = latest('jedi', config['jedi_version'])
except:
    config['jedi_version'] = None
    config['jedi_latest'] = latest('jedi')

try:
    import autopep8
    config['autopep8_version'] = autopep8.__version__
    config['autopep8_latest'] = latest('autopep8', config['autopep8_version'])
except:
    config['autopep8_version'] = None
    config['autopep8_latest'] = latest('autopep8')

try:
    import yapf
    config['yapf_version'] = yapf.__version__
    config['yapf_latest'] = latest('yapf', config['yapf_version'])
except:
    config['yapf_version'] = None
    config['yapf_latest'] = latest('yapf')

try:
    import black
    config['black_version'] = black.__version__
    config['black_latest'] = latest('black', config['black_version'])
except:
    config['black_version'] = None
    config['black_latest'] = latest('black')

json.dump(config, sys.stdout)
")
      (elpy-enable)
      (setq elpy-modules '(elpy-module-company
                           elpy-module-eldoc
                           elpy-module-pyvenv
                           elpy-module-yasnippet
                           elpy-module-sane-defaults))
      (setq elpy-rpc-timeout 10))
    ))

(defun python-personal/init-pip-decorate ()
  (use-package pip-decorate))

;;; packages.el ends here
