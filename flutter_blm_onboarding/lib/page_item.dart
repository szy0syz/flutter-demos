class PageItem {
  String imageUrl;
  String title;
  String description;

  PageItem(this.imageUrl, this.title, this.description);
}

List<PageItem> getPageItems() {
  return <PageItem>[
    PageItem('assets/images/blm_protests.svg', 'We are', 'We are'),
    PageItem('assets/images/blm_signs.svg', 'We are', 'We are'),
    PageItem('assets/images/blm_laptop.svg', 'We are', 'We are'),
    PageItem('assets/images/man_and_girl.svg', 'We are', 'We are'),
  ]
}
