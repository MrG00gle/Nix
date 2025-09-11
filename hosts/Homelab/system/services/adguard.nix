{ config, lib, pkgs, ... }: {
  services.adguardhome = {
    enable = true;
    # services.adguardhome.host = "0.0.0.0";
    # services.adguardhome.port = 3000;  # Default 3000
    services.adguardhome.openFirewall = true;
    settings = {
      http = {
        # You can select any ip and port, just make sure to open firewalls where needed
        address = "0.0.0.0:3000";
      };
      dns = {
        upstream_dns = [
          # Example config with quad9
          "9.9.9.9#dns.quad9.net"
          "149.112.112.112#dns.quad9.net"
          "8.8.8.8#dns.google"
          # Uncomment the following to use a local DNS service (e.g. Unbound)
          # Additionally replace the address & port as needed
          # "127.0.0.1:5335"
        ];
      };
      filtering = {
        protection_enabled = true;
        filtering_enabled = true;

        parental_enabled = false;  # Parental control-based DNS requests filtering.
        safe_search = {
          enabled = false;  # Enforcing "Safe search" option for search engines, when possible.
        };
      };
      # The following notation uses map
      # to not have to manually create {enabled = true; url = "";} for every filter
      # This is, however, fully optional
      filters = map(url: { enabled = true; url = url; }) [
        "https://adguardteam.github.io/HostlistsRegistry/assets/filter_9.txt"   # The Big List of Hacked Malware Web Sites
        "https://adguardteam.github.io/HostlistsRegistry/assets/filter_11.txt"  # malicious url blocklist
        "https://adguardteam.github.io/HostlistsRegistry/assets/filter_1.txt"   # AdGuard DNS filter
        "https://adguardteam.github.io/HostlistsRegistry/assets/filter_2.txt"   # AdAway Default Blocklist
        "https://adguardteam.github.io/HostlistsRegistry/assets/filter_4.txt"   # Dan Pollock's List
        "https://adguardteam.github.io/HostlistsRegistry/assets/filter_59.txt"  # AdGuard DNS Popup Hosts filter
        "https://adguardteam.github.io/HostlistsRegistry/assets/filter_7.txt"   # Perflyst and Dandelion Sprout's Smart-TV Blocklist
        "https://adguardteam.github.io/HostlistsRegistry/assets/filter_30.txt"  # Phishing URL Blocklist (PhishTank and OpenPhish)
        "https://adguardteam.github.io/HostlistsRegistry/assets/filter_14.txt"  # POL: Polish filters for Pi-hole
        "https://adguardteam.github.io/HostlistsRegistry/assets/filter_39.txt"  # Dandelion Sprout's Anti Push Notifications
        "https://adguardteam.github.io/HostlistsRegistry/assets/filter_12.txt"  # Dandelion Sprout's Anti-Malware List
        "https://adguardteam.github.io/HostlistsRegistry/assets/filter_3.txt"   # Peter Lowe's Blocklist
        "https://adguardteam.github.io/HostlistsRegistry/assets/filter_51.txt"  # HaGeZi's Pro++ Blocklist
        "https://adguardteam.github.io/HostlistsRegistry/assets/filter_33.txt"  # Steven Black's List
        "https://adguardteam.github.io/HostlistsRegistry/assets/filter_27.txt"  # OISD Blocklist Big
        "https://adguardteam.github.io/HostlistsRegistry/assets/filter_53.txt"  # AWAvenue Ads Rule
        "https://ewpratten.github.io/youtube_ad_blocklist/domains.txt"          # YouTube Ads
        "https://raw.githubusercontent.com/superover/TikTok-Blocklist/master/tiktok.txt"  # Tick-Tock blocklist
        "https://adguardteam.github.io/HostlistsRegistry/assets/filter_6.txt"   # Dandelion Sprout's Game Console Adblock List
        "https://adguardteam.github.io/HostlistsRegistry/assets/filter_11.txt"  # Malicious URL Blocklist (URLHaus)
        "https://adguardteam.github.io/HostlistsRegistry/assets/filter_52.txt"  # HaGeZi's Encrypted DNS/VPN/TOR/Proxy Bypass
        "https://adguardteam.github.io/HostlistsRegistry/assets/filter_56.txt"  # HaGeZi's The World's Most Abused TLDs
        "https://adguardteam.github.io/HostlistsRegistry/assets/filter_44.txt"  # HaGeZi's Threat Intelligence Feeds
      ];
    };
  };
}
