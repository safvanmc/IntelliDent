import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/api_post_model.dart';

/// API Data Source for fetching posts from JSONPlaceholder
class ApiDataSource {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const int defaultLimit = 10;

  /// Fetch posts with pagination using _page and _limit query parameters
  /// The API handles server-side pagination and returns the requested subset
  Future<List<ApiPostModel>> fetchPosts({
    int page = 1,
    int limit = defaultLimit,
  }) async {
    try {
      // Build URL with query parameters for server-side pagination
      final uri = Uri.parse('$baseUrl/posts').replace(
        queryParameters: {
          '_page': page.toString(),
          '_limit': limit.toString(),
        },
      );

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> jsonList =
            json.decode(response.body) as List<dynamic>;

        // API returns the paginated subset directly, just parse and return
        return jsonList
            .map((json) => ApiPostModel.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to load posts: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching posts: ${e.toString()}');
    }
  }
}
