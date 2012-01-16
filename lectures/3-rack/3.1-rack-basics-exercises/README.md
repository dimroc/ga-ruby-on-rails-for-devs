Basic Web Server w/ Rack
========================

1. Server should be able to serve files from a *public* directory with *index.html* as the default file name. For example, using a browser one should be able to navigate to http://localhost:9292 or http://localhost:9292/index.html and see the contents of *index.html*.
2. Server should return the correct *Content-Length* header. The value of the Content-Length header is a string that contains the number of bytes that are sent from the server to the client.
3. Server should return a *404 Not Found* error if the file doesn't exist. For example, navigating to http://localhost:9292/invalid.html should produce a *404 Not Found* error.
4. Bonus point if the server can serve files in subfolders of *public*. For example, navigating to http://localhost:9292/subfolder/index.html or http://localhost:9292/images/ should return *public/images/index.html*.
5. Bonus point if the server can also serve JPG images that render within an HTML page.
6. Bonus point if the server can serve files from directories that contain spaces in their name.

```
    |-Gemfile
    |-server.rb
    |+public
        |-index.html
        |+images
            |-index.html
            |-rack-logo.png
        |+has a space
            |-index.html
```

Quick tests for all points:

* [http://localhost:9292](http://localhost:9292/) <-- returns contents of *public/index.html* with content-type "text/html"
* [http://localhost:9292/index.html](http://localhost:9292/index.html) <-- returns contents of *public/index.html* with content-type "text/html"
* [http://localhost:9292/invalid](http://localhost:9292/invalid) <-- returns 404, file not found
* [http://localhost:9292/images](http://localhost:9292/images) <-- returns contents of *public/images/index.html* with content-type "text/html"
* [http://localhost:9292/images/](http://localhost:9292/images/) <-- returns contents of *public/images/index.html* with content-type "text/html"
* [http://localhost:9292/images/rack-logo.png](http://localhost:9292/images/rack-logo.png) <-- returns the rack-logo image with content-type "image/png"
* [http://localhost:9292/../../../../forbidden](http://localhost:9292/../../../../forbidden) <-- returns 403, forbidden (use `curl`)
* [http://localhost:9292/has a space/](http://localhost:9292/has a space/) <-- returns contents of *public/has a space/index.html* with content-type "text/html"

