/* ============================================================================
   Openwater docs — make Material grid cards fully clickable.

   Each <li> inside .grid.cards becomes its own click target: clicking
   anywhere on the card navigates to the card's primary <a> link. Existing
   anchor tags inside still work normally; middle-click / Cmd-click opens
   in a new tab.

   Uses Material's document$ observable so it works with navigation.instant
   (re-applies on every page swap), and falls back to DOMContentLoaded if
   document$ isn't available.
   ============================================================================ */

function makeCardsClickable() {
  document.querySelectorAll(".md-typeset .grid.cards > ul > li").forEach(function (card) {
    if (card.dataset.cardClickInitialized === "1") return;
    var link = card.querySelector("a[href]");
    if (!link) return;

    card.dataset.cardClickInitialized = "1";
    card.style.cursor = "pointer";
    card.setAttribute("role", "link");
    card.setAttribute("tabindex", "0");
    card.setAttribute("aria-label", link.textContent.trim() || link.href);

    card.addEventListener("click", function (e) {
      // Let real anchors inside the card behave normally
      if (e.target.closest("a")) return;

      // Honor middle-click and Cmd/Ctrl-click for new-tab
      if (e.ctrlKey || e.metaKey || e.button === 1) {
        window.open(link.href, "_blank", "noopener");
      } else {
        window.location.href = link.href;
      }
    });

    // Keyboard accessibility — Enter or Space activates the card
    card.addEventListener("keydown", function (e) {
      if (e.key === "Enter" || e.key === " ") {
        e.preventDefault();
        window.location.href = link.href;
      }
    });
  });
}

if (typeof document$ !== "undefined" && document$.subscribe) {
  // Material's instant-navigation observable — fires on initial load AND every page swap
  document$.subscribe(makeCardsClickable);
} else if (document.readyState === "loading") {
  document.addEventListener("DOMContentLoaded", makeCardsClickable);
} else {
  makeCardsClickable();
}
