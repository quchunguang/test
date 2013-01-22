'''
Created on 2012-12-11

@author: qcg
'''

import os, platform, logging


if platform.platform().startswith('Windows'):
    logging_file = os.path.join(os.getenv('HOMEDRIVE'), os.getenv('HOMEPATH'), 'test.log')
else:
    logging_file = os.path.join(os.getenv('HOME'), 'test.log')
logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s [%(levelname)s] %(message)s',
    filename=logging_file,
    filemode='a',
)
# test
logging.debug("Start of the program")
logging.info("Doing something")
logging.warning("Dying now")
