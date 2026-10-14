# Poddin Technologies Limited

The official website for Poddin Technologies Limited.

## Running the project

Run your project using `jaspr serve`.

The development server will be available on `http://localhost:8080`.

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

Hosting must serve a directory's `index.html` for the bare path (`/about` -> `about/index.html`), which is the
default on Firebase Hosting, Netlify, Vercel, GitHub Pages and Cloudflare Pages.

The share image is `web/images/og-banner.jpg` (1200 x 630, about 140 KB: WhatsApp skips preview images much larger than
300 KB). To change it, replace the file and keep that size; the generator references it by path.
