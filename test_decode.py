import json, base64, re

data = {
    "beads":[
        {"a":-1.5708,"ci":0,"d":"floral","s":9,"sh":"round","tx":"default"},
        {"a":-0.7854,"ci":6,"d":"wave","s":10,"sh":"round","tx":"default"}
    ],
    "msg":"Hello there!",
    "from":"Alice",
    "sc":"#c8a882",
    "st":3
}

js = json.dumps(data, ensure_ascii=False)
enc = base64.b64encode(js.encode('utf-8')).decode('ascii')
print('ENCODED_LEN:', len(enc))
print('ENCODED_SAMPLE:', enc[:96])

# Simulate share.html parseBeads behavior
raw = enc
is_b64 = bool(re.match(r'^[A-Za-z0-9+/=]+$', raw))
print('Looks like base64?', is_b64)
if is_b64:
    dec = base64.b64decode(raw).decode('utf-8')
    print('DECODED JSON:', dec)
    parsed = json.loads(dec)
    print('Parsed beads count:', len(parsed.get('beads',[])))
else:
    print('Not base64; test aborted')
