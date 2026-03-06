

Leak #2 (NGHIÊM TRỌNG)

Trong acquire():

player.attachMediaStatusListener();

Nhưng constructor của wrapper đã gọi:

attachMediaStatusListener()

Khi acquire lại:

sanitize()
→ clear listener

acquire()
→ attach again

Điều này đúng.

Nhưng có vấn đề:

onMediaStatus() overwrite callback

OK.

⸻

Nhưng bug ở đây:

attachMediaStatusListener():

lastUsed = DateTime.now();

Mỗi media event sẽ:

update lastUsed

→ lazy cleanup sẽ không bao giờ chạy với player idle nếu:

decoder vẫn emit status

Điều này có thể xảy ra.

⸻

Fix

Chỉ update lastUsed nếu:

isBusy == true

if (isBusy) {
  lastUsed = DateTime.now();
}


⸻

Leak #3 (nguy hiểm)

Trong release():

_idleUrlCache.putIfAbsent(wrapper.lastMediaUrl!, () => []).add(wrapper);

Nhưng trong _lazyCleanup() bạn remove:

_idleUrlCache[p.lastMediaUrl!]?.remove(p);

Nếu player:

release
→ acquire
→ release
→ acquire

wrapper có thể bị duplicate trong cache list.

⸻

Fix an toàn

_idleUrlCache[wrapper.lastMediaUrl!]?.remove(wrapper);
_idleUrlCache.putIfAbsent(...).add(wrapper);


⸻

Leak #4 (Texture leak risk)

Trong dispose() của widget:

_player.pause();

sau đó:

_tryDisposePlayer()

trong đó:

release(wrapper)

OK.

⸻

Nhưng nếu:

widget dispose
player still rendering texture

có thể gây Flutter texture leak.

Bạn nên:

_player.state = PlaybackState.stopped

trước khi release khi widget dispose.

⸻


⸻

5. Lỗi logic quan trọng

Bug #1 (nghiêm trọng)

Trong acquire():

player.lastMediaUrl = mediaUrl ?? player.lastMediaUrl;

Nếu:

mediaUrl == null

player sẽ giữ URL cũ.

Sau đó release:

cache map sẽ trỏ sai URL


⸻

Fix

player.lastMediaUrl = mediaUrl;


⸻

Bug #2

Trong _lazyCleanup():

_idleNormalPlayers.removeWhere

nhưng HQ player không cleanup.

Nếu HQ player bị unused:

memory leak


⸻

fix

cleanup HQ nếu:

>10 minutes

⸻

8. Một optimization rất mạnh bạn chưa dùng

Trong acquire():

Hiện tại:

media = widget.source

mỗi lần connect.

Nhưng nếu:

cacheHit == true

bạn có thể skip reconnect.

Pseudo:

if (cacheHit && player.state == playing) {
  return immediately
}

Switch:

36 → 9 → 36

sẽ instant.
