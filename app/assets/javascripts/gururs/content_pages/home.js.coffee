Gururs.ContentPages = {} if Gururs.ContentPages is undefined

Gururs.ContentPages.Home =->
  $.backstretch($('section.highlight').attr('data-url'))
