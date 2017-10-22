function FindProxyForURL(url, host) {
  return "localhost:44300";
  //return "localhost:44300; DIRECT";
}

// https://github.com/igrigorik/node-spdyproxy
// "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --proxy-pac-url=file:///path/to/config.pac --use-npn

