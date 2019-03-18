# -*- coding: utf-8 -*-
'''
Extract information about the server's role from its hostname, and store that role data in grains.
'''

from __future__ import absolute_import

import re
import socket

__proxyenabled__ = ['f5']

LOCATIONS = {'az': 'aws',
             'am': 'awsmumbai',
             'in': 'india',
             'l1': 'lehi1',
             'l2': 'lehi2',
             'ln': 'lindon',
             'lv': 'lasvegas',
             'pv': 'provo',
             'p2': 'provo2',
             'tx': 'texas',
             'hq': 'lehi',
             }

TRACKS = {'rapi': 'rapid',
          'stan': 'standard',
          'tran': 'transition'
          }

TITLE_VHOST = {'adminsync':      'AdminSync',
               'callcenter':     'CallCenter',
               'clientadmin':    'ClientAdmin',
               'medialibrary':   'MediaLibrary',
               'prospectportal': 'ProspectPortal',
               'residentportal': 'ResidentPortal',
               'residentsync':   'ResidentSync',
               'wwwentrata':     'www.entrata.com',
               }


def role():
    '''
    Create location, role, environment grains based on hostname
    '''

    grains = {}

    # Create general grains
    name = socket.gethostname().split('.')[0]

    regex = r'^(?P<location>\w{2})-(?P<role>\S+)(?P<identifier>\d{2})'\
            r'(?:-(?P<environment>\w{3}))?(?:-(?P<devuser>\w+))?(?:\..*\..*)?$'
    print name
    match = re.match(regex, name)

    if match:
        role_grains = match.groupdict()

        # Translate the location name
        role_grains['location'] = LOCATIONS[match.groupdict()['location']]

        # If no environment is given, assume production
        if not role_grains['environment']:
            role_grains['environment'] = 'prod'

        grains.update(role_grains)

    # Create web server specific grains
    web_regex = r'^web(-(?P<track>\w+))?-(?P<vhost>\w+)$'
    web_match = re.match(web_regex, grains['role'])

    if web_match:
        web_grains = web_match.groupdict()
        web_grains['role'] = 'web'

        # Translate the track name
        if web_grains['track'] is not None:
            web_grains['track'] = TRACKS[web_match.groupdict()['track']]

        # Create a grain for the capitalized vhost name
        if web_grains['vhost'] in TITLE_VHOST:
            web_grains['vhost_fullname'] = TITLE_VHOST[web_match.groupdict()['vhost']]
        else:
            web_grains['vhost_fullname'] = web_match.groupdict()['vhost'].title()

        grains.update(web_grains)
	print(grains)

    # Create Wordpress server specific grains
    wordpress_regex = r'^wordpress-(?P<blogname>\w+)$'
    wordpress_match = re.match(wordpress_regex, grains['role'])

    if wordpress_match:
        wordpress_grains = wordpress_match.groupdict()
        wordpress_grains['role'] = 'wordpress'
        grains.update(wordpress_grains)

	# Create Wordpress server specific grains
    wordpress_regex = r'^wordpress-(?P<blogname>\w+)$'
    wordpress_match = re.match(wordpress_regex, grains['role'])
    return grains

