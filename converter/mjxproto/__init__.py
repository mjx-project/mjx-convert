import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent))

from .mjx_pb2_grpc import *
from .mjx_pb2 import *