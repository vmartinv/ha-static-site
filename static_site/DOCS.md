# Static Site

Serves the files in `/share/<root>/` as a website inside Home Assistant, through Ingress: it gets a sidebar entry and only logged-in Home Assistant users (admins or not) can reach it. The add-on exposes no port.

## Options

- `root`: folder under `/share` to serve (default `static_site`). `index.html` is served for directory URLs.

## Notes

- Pages are served under the Ingress prefix (`/api/hassio_ingress/<token>/`), so links between your pages must be relative (`./about.html`, not `/about.html`).
- Files are read on each request: updating them takes effect immediately, no restart needed.
- Every logged-in user can see the site.
- BusyBox httpd, a few hundred KB of RAM.
