# Poddin Technologies Limited

The official website for Poddin Technologies Limited.

## Running the project

Run your project using `jaspr serve`.

The development server will be available on `http://localhost:5124`.

## Building the project

Build your project using `jaspr build`.

The output will be located inside the `build/jaspr/` directory.

## Link previews (page titles and Open Graph tags)

The site renders in the browser, so the HTML a server returns is an empty shell. Social crawlers (WhatsApp,
Facebook, LinkedIn, X) do not run JavaScript, so each route has its own HTML entry point with its title,
description, canonical URL and Open Graph / Twitter tags already in the markup: `web/index.html`,
`web/about/index.html` and `web/services/<slug>/index.html`. Static hosts serve these for `/`, `/about` and
`/services/<slug>`, and the app boots over them as usual.

These files are generated from the same data the pages use (`lib/content`). After changing a page title or
description, a service, or the site URL, regenerate them:

```sh
dart run tool/generate_page_html.dart          # write the files
dart run tool/generate_page_html.dart --check  # exit 1 if any file is out of date (for CI)
```

Hosting must serve a directory's `index.html` for the bare path (`/about` -> `about/index.html`), which is the default on Firebase Hosting, Netlify, Vercel, GitHub Pages and Cloudflare Pages.

The share image is `web/images/og-banner.jpg` (1200 x 630, about 140 KB: WhatsApp skips preview images much larger than 300 KB). To change it, replace the file and keep that size; the generator references it by path.

## Deploying (Firebase Hosting)

The site is served from the Hosting site `<site name>` in the Firebase project `<project id>`, at
`<site name>.web.app`. Deploy from the repository root:

```sh
jaspr build && firebase deploy --only hosting
```

`firebase.json` and `.firebaserc` are listed in `.gitignore`, so a fresh clone does not have them. Recreate both in the repository root before the first deploy (or run `firebase init hosting` and answer: existing project `<project id>`, public directory `build/jaspr`, single-page app: no, overwrite `index.html`: no).

`.firebaserc`:

```json
{
  "projects": {
    "default": "<project id>"
  }
}
```

`firebase.json`:

```json
{
  "hosting": {
    "site": "<site name>",
    "public": "build/jaspr",
    "ignore": ["firebase.json", "**/.*", "**/node_modules/**"],
    "cleanUrls": true,
    "trailingSlash": false,
    "rewrites": [
      {
        "source": "**",
        "destination": "/index.html"
      }
    ],
    "headers": [
      {
        "source": "**/*.@(html|js|css)",
        "headers": [{ "key": "Cache-Control", "value": "no-cache" }]
      },
      {
        "source": "/images/**",
        "headers": [
          { "key": "Cache-Control", "value": "public, max-age=86400" }
        ]
      }
    ]
  }
}
```

What the config does:

- `site` is the Hosting site, and `public` is the folder `jaspr build` writes to.
- `cleanUrls` and `trailingSlash: false` serve `about/index.html` at `/about` and redirect `/about/` to `/about`. Those per-route files carry each page's title and social tags (see "Link previews" above).
- The `**` rewrite sends any other path to the app, which shows its own "page not found".
- HTML, JS and CSS are revalidated on every load because their file names carry no hash, so a deploy is visible immediately. Images cache for a day.

When a custom domain is connected in the Firebase console, change `siteUrl` in `lib/content/company.dart`, then run `dart run tool/generate_page_html.dart` and deploy again so canonical and social-preview URLs match.
