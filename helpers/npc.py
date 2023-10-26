import json
import re
import sys
import urllib.request


def load_zones():
    with open('zone_ids.json') as jf:
        return json.load(jf)


def save_zones(data):
    with open('zone_ids.json', mode='w') as jf:
        json.dump(data, jf)


def do(npc_id):
    html = urllib.request.urlopen(f'https://www.wowhead.com/classic/npc={npc_id}').read().decode('utf-8')
    meta = re.search(r'<meta name="description" content="(?P<text>[^\"]+)">', html)
    assert meta is not None, str(npc_id)

    description = meta.groupdict()['text'].replace('&apos;', "'")

    match = re.match(r'^(?P<name>[A-Za-z\'\s]+?) is a level (?P<min_lvl>\d+)( - (?P<max_lvl>\d+))? (Rare )?Elite NPC that can be found in (?P<zone>[^\.]+)\.', description)  # noqa: E501
    assert match is not None
    npc_data = match.groupdict()

    template = r'{["id"] = %d, ["name"] = {["English"] = "%s"}, ["reacts"] = "Hostile", ["xp_level"] = {["is_elite"] = 1, ["max"] = %d, ["min"] = %d}, ["zone_id"] = %d},'  # noqa: E501

    zone = npc_data['zone']
    zone_name_to_id = load_zones()
    if zone not in zone_name_to_id:
        zone_name_to_id[zone] = int(input(f'{zone} ID: '))
        save_zones(zone_name_to_id)

    min_lvl = int(npc_data['min_lvl'])
    max_lvl = int(npc_data['max_lvl']) if npc_data['max_lvl'] is not None else min_lvl

    print(template % (npc_id, npc_data['name'], max_lvl, min_lvl, zone_name_to_id[zone]))  # noqa: E501


npcs = [

]

for npc_id in npcs:
    try:
        do(npc_id)
    except KeyboardInterrupt:
        break
    except AssertionError:
        print(str(npc_id), file=sys.stderr)
