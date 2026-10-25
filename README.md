# Static Site add-on for Home Assistant

Serves the files in `/share/<root>/` as a website inside Home Assistant, through Ingress: it gets a sidebar entry and only logged-in Home Assistant users (admins or not) can reach it. The add-on exposes no port.

## Options

- `root`: folder under `/share` to serve (default `static_site`). `index.html` is served for directory URLs.

## Notes

- Pages are served under the Ingress prefix (`/api/hassio_ingress/<token>/`), so links between your pages must be relative (`./about.html`, not `/about.html`).
- Files are read on each request: updating them takes effect immediately, no restart needed.
- Every logged-in user can see the site.
- BusyBox httpd, a few hundred KB of RAM.

## Example

[`example/`](example) is a minimal site: an `index.html` that loads `style.css` and `img/logo.svg` through relative paths. Copy it to `/share/static_site/` to try it.

### Full-screen pages

The add-on panel shows your page in an iframe below Home Assistant's top bar and next to its sidebar. The iframe is same-origin, so a page can make it cover the whole window, hiding both, while Home Assistant keeps the session alive underneath. Put this in the page's `<head>` (it does nothing when the page is opened outside Home Assistant):

```html
<script>
try { const f = window.frameElement; if (f) f.style.cssText = "position:fixed;inset:0;width:100%;height:100vh;height:100dvh;z-index:2147483647;border:0"; } catch (e) {}
</script>
```

To get back to Home Assistant, use the browser's back button or link to `/` with `target="_top"`.

## Install

Settings → Add-ons → Add-on store → ⋮ → Repositories → add `https://github.com/vmartinv/ha-static-site`, then install **Static Site**, set `root` and start it.
