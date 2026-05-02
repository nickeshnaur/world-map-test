#!/bin/bash
set -e

ROOT="/Users/eshnaur/Desktop/Junk Drawer/Digital Projects/World Map Test"
SRC="$ROOT/index.html"

build_region() {
  local slug="$1"          # africa
  local pageRegion="$2"    # Africa  (PAGE_REGION value)
  local titleName="$3"     # Africa
  local count="$4"         # 54
  local keywords="$5"
  local description="$6"
  local noscriptBlurb="$7"

  local outdir="$ROOT/$slug"
  mkdir -p "$outdir"
  cp "$SRC" "$outdir/index.html"

  cd "$outdir"
  sed -i '' \
    -e "s|<title>World Map Test — Interactive Country Geography Quiz</title>|<title>${titleName} Map Quiz — Identify All ${count} ${pageRegion} Countries</title>|" \
    -e "s|content=\"Test your geography knowledge with an interactive world map quiz. Click each country and identify it by name. Free, no sign-up, works on desktop and mobile.\"|content=\"${description}\"|" \
    -e "s|content=\"world map quiz, country quiz, geography quiz, interactive map, identify countries, world geography test\"|content=\"${keywords}\"|" \
    -e '/<meta name="google-site-verification"/d' \
    -e "s|<link rel=\"canonical\" href=\"https://worldmaptest.com/\">|<link rel=\"canonical\" href=\"https://worldmaptest.com/${slug}/\">|" \
    -e 's|href="favicon.svg"|href="/favicon.svg"|' \
    -e "s|\"og:url\" content=\"https://worldmaptest.com/\"|\"og:url\" content=\"https://worldmaptest.com/${slug}/\"|" \
    -e "s|\"twitter:url\" content=\"https://worldmaptest.com/\"|\"twitter:url\" content=\"https://worldmaptest.com/${slug}/\"|" \
    -e "s|\"og:title\" content=\"World Map Test — Interactive Country Geography Quiz\"|\"og:title\" content=\"${titleName} Map Quiz — Identify All ${count} ${pageRegion} Countries\"|" \
    -e "s|\"og:description\" content=\"Test your geography knowledge with an interactive world map quiz. Click each country and identify it by name.\"|\"og:description\" content=\"Free interactive quiz to identify all ${count} ${pageRegion} countries on a map.\"|" \
    -e "s|\"twitter:title\" content=\"World Map Test — Interactive Country Geography Quiz\"|\"twitter:title\" content=\"${titleName} Map Quiz — ${count} Countries\"|" \
    -e "s|\"twitter:description\" content=\"Test your geography knowledge with an interactive world map quiz.\"|\"twitter:description\" content=\"Free interactive quiz to identify all ${count} ${pageRegion} countries on a map.\"|" \
    -e "s|cursor: url('cursor.svg')|cursor: url('/cursor.svg')|" \
    -e "s|<h1>World Map Test — Interactive Country Geography Quiz</h1>|<h1>${titleName} Map Quiz — Identify All ${count} ${pageRegion} Countries</h1>|" \
    -e "s|<p>Test your geography knowledge with an interactive world map quiz. Click each country on the map and identify it by name. Free to play, works on any modern browser. JavaScript is required to play.</p>|<p>${noscriptBlurb}</p>|" \
    -e "s|    <h1>World Map Test</h1>|    <h1>${titleName} Map Quiz</h1>|" \
    -e "s|\"name\": \"World Map Test\",|\"name\": \"${titleName} Map Quiz\",|" \
    -e "s|\"url\": \"https://worldmaptest.com/\",|\"url\": \"https://worldmaptest.com/${slug}/\",|" \
    -e "s|\"description\": \"Interactive world map geography quiz. Identify countries by clicking them on the map.\"|\"description\": \"Interactive ${pageRegion} map geography quiz. Identify all ${count} countries in ${pageRegion} by clicking them on the map.\"|" \
    -e "s|<!-- Google tag (gtag.js) -->|<script type=\"application/ld+json\">\\
{\\
  \"@context\": \"https://schema.org\",\\
  \"@type\": \"BreadcrumbList\",\\
  \"itemListElement\": [\\
    {\"@type\": \"ListItem\", \"position\": 1, \"name\": \"World Map Test\", \"item\": \"https://worldmaptest.com/\"},\\
    {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"${titleName} Map Quiz\", \"item\": \"https://worldmaptest.com/${slug}/\"}\\
  ]\\
}\\
</script>\\
<script>window.PAGE_REGION = \"${pageRegion}\";</script>\\
\\
<!-- Google tag (gtag.js) -->|" \
    index.html

  echo "Built /$slug/"
}

build_region "europe"   "Europe"   "Europe"   "46" \
  "europe map quiz, european country quiz, european geography quiz, countries of europe, europe map test" \
  "Free interactive quiz to identify all 46 countries in Europe on a map. Click each country and name it. No sign-up. Works on mobile and desktop." \
  "Test your knowledge of European geography with an interactive map quiz covering all 46 countries in Europe. Click each country on the map and identify it by name. Free, no sign-up, works on desktop and mobile."

build_region "africa"   "Africa"   "Africa"   "54" \
  "africa map quiz, african country quiz, african geography quiz, countries of africa, africa map test" \
  "Free interactive quiz to identify all 54 countries in Africa on a map. Click each country and name it. No sign-up. Works on mobile and desktop." \
  "Test your knowledge of African geography with an interactive map quiz covering all 54 countries in Africa. Click each country on the map and identify it by name. Free, no sign-up, works on desktop and mobile."

build_region "asia"     "Asia"     "Asia"     "49" \
  "asia map quiz, asian country quiz, asian geography quiz, countries of asia, asia map test" \
  "Free interactive quiz to identify all 49 countries in Asia on a map. Click each country and name it. No sign-up. Works on mobile and desktop." \
  "Test your knowledge of Asian geography with an interactive map quiz covering all 49 countries in Asia, including Russia. Click each country on the map and identify it by name. Free, no sign-up, works on desktop and mobile."

build_region "americas" "Americas" "Americas" "35" \
  "americas map quiz, north america quiz, south america quiz, american geography quiz, countries of the americas" \
  "Free interactive quiz to identify all 35 countries in North and South America on a map. Click each country and name it. No sign-up. Works on mobile and desktop." \
  "Test your knowledge of geography in the Americas with an interactive map quiz covering all 35 countries in North America, Central America, South America, and the Caribbean. Click each country on the map and identify it by name. Free, no sign-up, works on desktop and mobile."

build_region "oceania"  "Oceania"  "Oceania"  "14" \
  "oceania map quiz, pacific country quiz, oceania geography quiz, countries of oceania, oceania map test" \
  "Free interactive quiz to identify all 14 countries in Oceania on a map. Click each country and name it. No sign-up. Works on mobile and desktop." \
  "Test your knowledge of Oceanian geography with an interactive map quiz covering all 14 countries in Oceania, including Australia, New Zealand, and the Pacific island nations. Click each country on the map and identify it by name. Free, no sign-up, works on desktop and mobile."
