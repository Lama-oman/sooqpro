import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/listing.dart';

class SupabaseService {
  final SupabaseClient _client = Supabase.instance.client;

  // Listings
  Future<List<Listing>> getListings() async {
    final response = await _client
        .from('listings')
        .select()
        .eq('is_approved', true)
        .order('created_at', ascending: false);
    
    return (response as List).map((json) => Listing.fromJson(json)).toList();
  }

  Future<List<Listing>> getPendingListings() async {
    final response = await _client
        .from('listings')
        .select()
        .eq('is_approved', false)
        .order('created_at', ascending: false);
    
    return (response as List).map((json) => Listing.fromJson(json)).toList();
  }

  Future<Listing?> getListing(String id) async {
    final response = await _client
        .from('listings')
        .select()
        .eq('id', id)
        .single();
    
    return response != null ? Listing.fromJson(response) : null;
  }

  Future<void> createListing(Listing listing) async {
    await _client.from('listings').insert(listing.toJson());
  }

  Future<void> updateListing(Listing listing) async {
    await _client.from('listings').update(listing.toJson()).eq('id', listing.id);
  }

  Future<void> deleteListing(String id) async {
    await _client.from('listings').delete().eq('id', id);
  }

  Future<void> approveListing(String id) async {
    await _client.from('listings').update({'is_approved': true}).eq('id', id);
  }

  // Categories
  Future<List<Category>> getCategories() async {
    final response = await _client.from('categories').select().order('name');
    return (response as List).map((json) => Category.fromJson(json)).toList();
  }

  // Storage
  Future<String> uploadImage(String path, List<int> bytes) async {
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    await _client.storage.from('listing-images').uploadBinary(
      '$path/$fileName',
      bytes,
      fileOptions: const FileOptions(contentType: 'image/jpeg'),
    );
    return _client.storage.from('listing-images').getPublicUrl('$path/$fileName');
  }
}
