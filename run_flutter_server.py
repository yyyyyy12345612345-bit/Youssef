import os
import sys
import webbrowser
from http.server import HTTPServer, SimpleHTTPRequestHandler

PORT = 8080
DIRECTORY = os.path.join(os.path.dirname(os.path.abspath(__file__)), "youssef_app", "build", "web")

SimpleHTTPRequestHandler.extensions_map['.wasm'] = 'application/wasm'
SimpleHTTPRequestHandler.extensions_map['.js'] = 'application/javascript'

class FlutterHandler(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=DIRECTORY, **kwargs)

    def end_headers(self):
        # Enable CORS and COOP/COEP headers for WebAssembly / SharedArrayBuffer
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Cross-Origin-Opener-Policy', 'same-origin')
        self.send_header('Cross-Origin-Embedder-Policy', 'require-corp')
        self.send_header('Cache-Control', 'no-cache')
        super().end_headers()

def main():
    if not os.path.exists(DIRECTORY):
        print(f"Directory not found: {DIRECTORY}")
        return

    os.chdir(DIRECTORY)
    server = HTTPServer(('127.0.0.1', PORT), FlutterHandler)
    url = f"http://localhost:{PORT}"
    print(f"Flutter App running at {url}")
    try:
        webbrowser.open(url)
    except Exception:
        pass

    try:
        server.serve_forever()
    except KeyboardInterrupt:
        print("Server stopped.")
        server.server_close()

if __name__ == '__main__':
    main()
