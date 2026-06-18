import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerPrivacySecurityPage extends StatelessWidget {
  const OwnerPrivacySecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'HealthyPet Privacy & Security',
          style: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff4A5E72), Color(0xff5A7A9A)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(Icons.shield_outlined, color: Colors.white, size: 36),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'HealthyPet Privacy & Security',
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Informasi tentang bagaimana data Anda dilindungi dalam sistem ini.',
                          style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.4),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Section 1: Siapa yang dapat melihat data saya?
            _buildSectionTitle(Icons.visibility_outlined, 'Siapa yang dapat melihat data saya?'),
            const SizedBox(height: 12),
            _buildCard(
              children: [
                const Text(
                  'Dokter hewan yang menangani hewan peliharaan Anda dapat mengakses informasi berikut:',
                  style: TextStyle(fontSize: 13, color: Colors.black87, height: 1.5),
                ),
                const SizedBox(height: 16),
                _buildDataAccessGroup('Data Hewan Peliharaan', [
                  'Nama hewan',
                  'Kode hewan (Pet Code)',
                  'Spesies',
                  'Ras',
                  'Usia',
                  'Berat badan',
                  'Jenis kelamin',
                  'Foto hewan',
                  'Tanggal lahir',
                ]),
                const SizedBox(height: 12),
                _buildDataAccessGroup('Riwayat Medis', [
                  'Riwayat vaksinasi',
                  'Rekam medis (diagnosa, tindakan, catatan)',
                ]),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xffEBF5FB),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.info_outline, size: 18, color: Color(0xff4A5E72)),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Dokter tidak dapat mengakses informasi pribadi yang tidak diperlukan untuk pelayanan medis.',
                          style: TextStyle(fontSize: 12, color: Color(0xff4A5E72), height: 1.4),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Section 2: Informasi pribadi saya
            _buildSectionTitle(Icons.person_outline, 'Informasi pribadi saya'),
            const SizedBox(height: 12),
            _buildCard(
              children: [
                _buildAccessRow(Icons.check_circle, Colors.green, 'Nama lengkap', 'Terlihat oleh dokter'),
                const Divider(height: 24),
                _buildAccessRow(Icons.remove_circle, Colors.orange, 'Nomor telepon', 'Opsional — hanya jika diperlukan untuk komunikasi klinik'),
                const Divider(height: 24),
                _buildAccessRow(Icons.cancel, Colors.red, 'Kata sandi akun', 'Tidak pernah ditampilkan'),
                const Divider(height: 24),
                _buildAccessRow(Icons.cancel, Colors.red, 'Token autentikasi', 'Tidak pernah ditampilkan'),
                const Divider(height: 24),
                _buildAccessRow(Icons.cancel, Colors.red, 'ID sistem internal', 'Tidak pernah ditampilkan'),
              ],
            ),

            const SizedBox(height: 24),

            // Section 3: Kepemilikan data
            _buildSectionTitle(Icons.verified_user_outlined, 'Data Anda adalah milik Anda'),
            const SizedBox(height: 12),
            _buildCard(
              children: [
                const Text(
                  'Sebagai pemilik hewan, Anda memiliki kendali penuh atas data pribadi dan data hewan peliharaan Anda.',
                  style: TextStyle(fontSize: 13, color: Colors.black87, height: 1.5),
                ),
                const SizedBox(height: 16),
                _buildPermissionItem(Icons.check, Colors.green, 'Memperbarui profil Anda'),
                _buildPermissionItem(Icons.check, Colors.green, 'Memperbarui informasi hewan peliharaan'),
                _buildPermissionItem(Icons.check, Colors.green, 'Melihat riwayat vaksinasi'),
                _buildPermissionItem(Icons.check, Colors.green, 'Melihat rekam medis'),
                const SizedBox(height: 12),
                _buildPermissionItem(Icons.close, Colors.red, 'Mengubah rekam medis dokter'),
                _buildPermissionItem(Icons.close, Colors.red, 'Menghapus rekam medis dokter'),
              ],
            ),

            const SizedBox(height: 24),

            // Section 4: Keamanan
            _buildSectionTitle(Icons.lock_outline, 'Keamanan'),
            const SizedBox(height: 12),
            _buildCard(
              children: [
                const Text(
                  'Sistem melindungi data Anda melalui mekanisme keamanan berikut:',
                  style: TextStyle(fontSize: 13, color: Colors.black87, height: 1.5),
                ),
                const SizedBox(height: 16),
                _buildSecurityFeature(
                  Icons.login,
                  'Autentikasi terlindungi',
                  'Pengguna harus login sebelum mengakses data apapun.',
                ),
                _buildSecurityFeature(
                  Icons.timer_outlined,
                  'Sesi terlindungi',
                  'Pengguna tanpa sesi aktif akan diarahkan ke halaman Login.',
                ),
                _buildSecurityFeature(
                  Icons.admin_panel_settings_outlined,
                  'Kontrol akses berbasis peran',
                  'Setiap pengguna hanya dapat melihat informasi sesuai perannya.',
                ),
                _buildSecurityFeature(
                  Icons.data_usage_outlined,
                  'Minimisasi data',
                  'Hanya informasi yang diperlukan yang ditampilkan ke masing-masing peran.',
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Section 5: Data yang dilindungi
            _buildSectionTitle(Icons.security_outlined, 'Data yang Dilindungi'),
            const SizedBox(height: 12),
            _buildCard(
              children: [
                _buildProtectedDataRow(Icons.person, 'Informasi profil'),
                _buildProtectedDataRow(Icons.pets, 'Data hewan peliharaan'),
                _buildProtectedDataRow(Icons.medical_services, 'Rekam medis'),
                _buildProtectedDataRow(Icons.vaccines, 'Data vaksinasi'),
                _buildProtectedDataRow(Icons.key, 'Sesi login'),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.lock, size: 18, color: Colors.green),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Kata sandi Anda tidak pernah ditampilkan di dalam aplikasi.',
                          style: TextStyle(fontSize: 12, color: Colors.green, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // ─── Helper Widgets ─────────────────────────────────────────────

  Widget _buildSectionTitle(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, size: 20, color: const Color(0xff4A5E72)),
        const SizedBox(width: 8),
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
      ],
    );
  }

  Widget _buildCard({required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: children),
    );
  }

  Widget _buildDataAccessGroup(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xff4A5E72))),
        const SizedBox(height: 8),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Row(
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(color: Color(0xff4A5E72), shape: BoxShape.circle),
              ),
              const SizedBox(width: 10),
              Text(item, style: const TextStyle(fontSize: 13, color: Colors.black87)),
            ],
          ),
        )),
      ],
    );
  }

  Widget _buildAccessRow(IconData icon, Color color, String title, String subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: color),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87)),
              const SizedBox(height: 2),
              Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.black54)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPermissionItem(IconData icon, Color color, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(fontSize: 13, color: Colors.black87)),
        ],
      ),
    );
  }

  Widget _buildSecurityFeature(IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xffEBF5FB),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 18, color: const Color(0xff4A5E72)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black87)),
                const SizedBox(height: 2),
                Text(description, style: const TextStyle(fontSize: 12, color: Colors.black54, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProtectedDataRow(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, size: 16, color: const Color(0xff4A5E72)),
          ),
          const SizedBox(width: 12),
          Text(label, style: const TextStyle(fontSize: 13, color: Colors.black87)),
          const Spacer(),
          const Icon(Icons.verified, size: 16, color: Colors.green),
        ],
      ),
    );
  }
}
