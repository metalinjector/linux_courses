import sys
sys.path.insert(0, '/vagrant/example/app/')
from hello import app as application

sys.stdout = sys.stderr
