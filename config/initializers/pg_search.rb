PgSearch.multisearch_options = {
  :against => "content",
  :using => {
    :tsearch => { :prefix => true,
                  :dictionary => "english"
    }
  }
}
