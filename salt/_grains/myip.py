# -*- coding: utf-8 -*-
'''
The myip grain returns whichever IP address it considers to be 'primary' for this host. The returned IP should be
useful for general communication with the host.
'''
from __future__ import absolute_import
import salt.utils


def myip():
    '''
    Return the 'primary' ip for this host
    '''
    grains = {}

    ips = salt.utils.network.ip_addrs(include_loopback=False)

    grains['myip'] = sorted(ips)[0]

    return grains
