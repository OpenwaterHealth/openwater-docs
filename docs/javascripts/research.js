/* Initialize after each Material instant-navigation page swap. */
function initializeResearchLibrary() {
  const root = document.querySelector('.ow-research');
  const search = root?.querySelector('#research-search');
  if (!search || root.dataset.researchInitialized === 'true') return;
  root.dataset.researchInitialized = 'true';
  const platform = root.querySelector('#platform');
  const type = root.querySelector('#document-type');
  const records = Array.from(root.querySelectorAll('[data-research-record]'));
  function filterLibrary() {
    const query = search.value.trim().toLowerCase();
    let count = 0;
    records.forEach(record => {
      const matches = (platform.value === 'all' || record.dataset.platform === platform.value) &&
        (type.value === 'all' || record.dataset.type === type.value) &&
        (record.textContent + ' ' + record.dataset.topics).toLowerCase().includes(query);
      record.hidden = !matches;
      if (matches) count += 1;
    });
    root.querySelector('#empty-state').hidden = count > 0;
    root.querySelector('#result-count').textContent = count
      ? `${count} study ${count === 1 ? 'preview' : 'previews'} · Awaiting release`
      : 'No matching documents';
  }
  search.addEventListener('input', filterLibrary);
  platform.addEventListener('change', filterLibrary);
  type.addEventListener('change', filterLibrary);
  root.querySelectorAll('[data-reset]').forEach(button => button.addEventListener('click', () => {
    search.value = ''; platform.value = 'all'; type.value = 'all'; filterLibrary();
  }));
  filterLibrary();
}
if (typeof document$ !== 'undefined' && document$.subscribe) {
  document$.subscribe(initializeResearchLibrary);
} else if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initializeResearchLibrary);
} else {
  initializeResearchLibrary();
}
