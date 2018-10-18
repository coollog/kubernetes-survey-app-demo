package frontend

import io.micronaut.http.HttpHeaders
import io.micronaut.http.HttpResponse
import io.micronaut.http.MediaType
import io.micronaut.http.annotation.Controller
import io.micronaut.http.annotation.Get

@Controller("/")
class WebController {

  static def serveHtml(String filename) {
    HttpResponse.ok(getClass().getResource("/public/" + filename).text)
        .header(HttpHeaders.CACHE_CONTROL, "no-cache, no-store, must-revalidate")
        .header(HttpHeaders.CONTENT_TYPE, MediaType.TEXT_HTML)
  }

  @Get("/")
  def index() {
    serveHtml("index.html")
  }

  @Get("/results")
  def results() {
    serveHtml("results.html")
  }
}
