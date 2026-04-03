//function FindProxyForURL(url, host) {

    // =========================
    // 1. NEVER proxy local stuff
    // =========================
    //if (
    //    isPlainHostName(host) ||
    //    dnsDomainIs(host, "localhost") ||
    //    shExpMatch(host, "127.0.0.1") ||
    //    shExpMatch(host, "*.local")
    //) {
    //    return "DIRECT";
    //}

    // =========================
    // 2. DVWA (your lab target)
    // =========================
    //if (
    //    shExpMatch(host, "dvwa.local") ||
    //    shExpMatch(host, "dvwa") ||
    //    shExpMatch(host, "192.168.*")
    //) {
    //    return "PROXY 127.0.0.1:8080";
    //}

    // =========================
    // 3. Everything else
    // =========================
    //return "DIRECT";
//}
