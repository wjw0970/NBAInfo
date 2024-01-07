import SwiftUI
import WebKit



struct ContentView: View {
    let nbaTeams = [
        "Atlanta Hawks", "Boston Celtics", "Brooklyn Nets", "Charlotte Hornets",
        "Chicago Bulls", "Cleveland Cavaliers", "Dallas Mavericks", "Denver Nuggets",
        "Detroit Pistons", "Golden State Warriors", "Houston Rockets", "Indiana Pacers",
        "LA Clippers", "Los Angeles Lakers", "Memphis Grizzlies", "Miami Heat",
        "Milwaukee Bucks", "Minnesota Timberwolves", "New Orleans Pelicans",
        "New York Knicks", "Oklahoma City Thunder", "Orlando Magic", "Philadelphia 76ers",
        "Phoenix Suns", "Portland Trail Blazers", "Sacramento Kings", "San Antonio Spurs",
        "Toronto Raptors", "Utah Jazz", "Washington Wizards"
    ]

    @State private var selectedTeam: String?

    var body: some View {
        NavigationView {
            List(nbaTeams, id: \.self) { team in
                NavigationLink(
                    destination: WebView(url: googleSearchURL(for: team)),
                    tag: team,
                    selection: $selectedTeam
                ) {
                    Text(team)
                }
                .tag(team)
            }
            .navigationTitle("NBA Teams")
        }
        .onAppear {
            // Set a default team if needed
            selectedTeam = nbaTeams.first
        }
    }





    private func googleSearchURL(for team: String) -> URL? {
        let query = team.replacingOccurrences(of: " ", with: "+")
        let urlString = "https://www.google.com/search?q=\(query)"
        return URL(string: urlString)
    }
}

struct WebView: UIViewRepresentable {
    let url: URL?

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = url {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView

        init(_ parent: WebView) {
            self.parent = parent
        }
    }
}
