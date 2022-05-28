class PageModel {
  final average_rank;
  final total;
  final per_page;
  final current_page;
  final last_page;
  final first_page_url;
  final last_page_url;
  final next_page_url;
  final prev_page_url;
  final from;
  final to;


  PageModel(
      { this.average_rank,
       this.total,
       this.per_page,
       this.current_page,
       this.last_page,
       this.first_page_url,
       this.last_page_url,
       this.next_page_url,
       this.prev_page_url,
       this.from,
       this.to});

  static PageModel fromJson(json) {
    print('inside page model : ${json['average_rank']}');
    return PageModel(
        average_rank: json['average_rank'],
        total: json['total'],
        per_page: json['per_page'],
        current_page: json['current_page'],
        last_page: json['last_page'],
        first_page_url: json['first_page_url'],
        last_page_url: json['last_page_url'],
        next_page_url: json['next_page_url'],
        prev_page_url: json['prev_page_url'],
        from: json['from'],
        to: json['to']);
  }
}
