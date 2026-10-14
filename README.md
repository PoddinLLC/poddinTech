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
`web/about.html` and `web/services/<slug>.html`. Static hosts serve these for `/`, `/about` and
`/services/<slug>`, and the app boots over them as usual.

These files are generated from the same data the pages use (`lib/content`). After changing a page title or
description, a service, or the site URL, regenerate them:

```sh
dart run tool/generate_page_html.dart          # write the files
dart run tool/generate_page_html.dart --check  # exit 1 if any file is out of date (for CI)
```

The pages are flat `.html` files, not `about/index.html`, because GitHub Pages redirects `/about` to `/about/` when it finds a directory, and that no longer matches the canonical URL. Hosts that serve `about.html` at `/about` (GitHub Pages, Firebase Hosting with `cleanUrls`, Netlify, Cloudflare Pages) work as is.

The share image is `web/images/og-banner.jpg` (1200 x 630, about 140 KB: WhatsApp skips preview images much larger than 300 KB). To change it, replace the file and keep that size; the generator references it by path.

## Fonts

IBM Plex is self-hosted from `web/fonts/` (Latin subset; the `@font-face` rules are at the top of `web/site.css`)
and preloaded from each page's HTML, so text renders in Plex on first paint instead of swapping from a fallback.
If a font file changes, give it a new file name and update `web/site.css` and `_preloadedFonts` in
`tool/generate_page_html.dart`.

## Deploying (GitHub Pages)

The site is served at https://poddin.net from GitHub Pages. Every push to `main` runs
`.github/workflows/pages.yml`, which:

1. checks that the generated page HTML is up to date (`dart run tool/generate_page_html.dart --check`),
2. runs `jaspr build`,
3. copies `index.html` to `404.html`, so unknown paths show the app's own "page not found",
4. publishes `build/jaspr/` to Pages.

You can also run it from the Actions tab (**Run workflow**). If the check step fails, run
`dart run tool/generate_page_html.dart`, commit the changed files and push again.

One-time setup, already done for this repository:

- **Settings -> Pages -> Source:** GitHub Actions.
- **Settings -> Pages -> Custom domain:** `poddin.net`, with **Enforce HTTPS** on.
- **DNS** at the domain registrar: four `A` records for the apex (`185.199.108.153`, `185.199.109.153`,
  `185.199.110.153`, `185.199.111.153`).

`web/CNAME` (`poddin.net`) ships in the build. If the domain changes, update it, `siteUrl` in
`lib/content/company.dart` and the repository's custom-domain setting, then regenerate the page HTML.

GitHub Pages sends `Cache-Control: max-age=600` for every file and that cannot be changed, so a deploy can take up
to ten minutes to reach visitors who already loaded the site.
