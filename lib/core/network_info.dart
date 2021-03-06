part of core;

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetWorkInfoImpl implements NetworkInfo {
  NetWorkInfoImpl._();

  static NetWorkInfoImpl instance = NetWorkInfoImpl._();

  @override
  Future<bool> get isConnected => _isConnected();

  Future<void> noConnectionWarning(BuildContext context) async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Oops you seem to be offline'),
        backgroundColor: Colors.red[400],
      ),
    );
    return;
  }

  Future<void> loadingFromCache(BuildContext context) async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Loading Post from cache'),
        backgroundColor: Colors.green[400],
      ),
    );
    return;
  }

  Future<bool> _isConnected() async {
    if (await _hasNoNetwork()) return false;
    if (await _hasNetwork()) return true;
    return false;
  }

  Future<bool> _hasNetwork() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    return result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi;
  }

  Future<bool> _hasNoNetwork() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    return result == ConnectivityResult.none || !(await _hasNetwork());
  }
}
