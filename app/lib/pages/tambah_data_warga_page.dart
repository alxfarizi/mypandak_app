import 'package:flutter/material.dart';

class TambahDataWargaPage extends StatefulWidget {
  const TambahDataWargaPage({super.key});

  @override
  State<TambahDataWargaPage> createState() => _TambahDataWargaPageState();
}

class _TambahDataWargaPageState extends State<TambahDataWargaPage> {
  final TextEditingController _desaWismaController = TextEditingController();
  final TextEditingController _namaKepalaController = TextEditingController();
  final TextEditingController _noRegistrasiController = TextEditingController();
  final TextEditingController _noKtpNikController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _jabatanController = TextEditingController();
  final TextEditingController _tempatLahirController = TextEditingController();
  final TextEditingController _tanggalLahirController = TextEditingController();
  final TextEditingController _bulanLahirController = TextEditingController();
  final TextEditingController _tahunLahirController = TextEditingController();
  final TextEditingController _umurController = TextEditingController();
  final TextEditingController _desaKelController = TextEditingController();
  final TextEditingController _kabKotaController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _jenisAkseptorKbController = TextEditingController();
  final TextEditingController _frekuensiPosyanduController = TextEditingController();

  String? _jenisKelamin;
  String? _statusPerkawinan;
  String? _statusDalamKeluarga;
  String? _agama;
  String? _statusTinggal;
  String? _pendidikan;
  String? _pekerjaan;
  String? _akseptorKb;
  String? _aktifPosyandu;
  String? _binaBalita;
  String? _memilikiTabungan;
  String? _ikutPaud;
  String? _ikutKoperasi;
  String? _berkebutuhanKhusus;
  String? _jenisAkseptorKb;
  String? _frekuensiPosyandu;
  String? _paketTabungan;

  static const double _labelFontSize = 12;
  static const double _valueFontSize = 12;
  static const EdgeInsets _sectionPadding = EdgeInsets.zero;
  static const double _labelWidth = 164;
  static const double _colonWidth = 18;
  static const double _labelTopOffset = 0;
  static const double _rightGap = 10;
  final Color _dotColor = const Color(0xFFA0A0A0);

  @override
  void dispose() {
    _desaWismaController.dispose();
    _namaKepalaController.dispose();
    _noRegistrasiController.dispose();
    _noKtpNikController.dispose();
    _namaController.dispose();
    _jabatanController.dispose();
    _tempatLahirController.dispose();
    _tanggalLahirController.dispose();
    _bulanLahirController.dispose();
    _tahunLahirController.dispose();
    _umurController.dispose();
    _desaKelController.dispose();
    _kabKotaController.dispose();
    _alamatController.dispose();
    _jenisAkseptorKbController.dispose();
    _frekuensiPosyanduController.dispose();
    super.dispose();
  }

  Widget _buildTwoColRow({
    required String label,
    required Widget right,
    double labelTopOffset = _labelTopOffset,
    CrossAxisAlignment rowAlign = CrossAxisAlignment.center,
    bool showColon = true,
  }) {
    return Row(
      crossAxisAlignment: rowAlign,
      children: [
        SizedBox(
          width: _labelWidth,
          child: Padding(
            padding: EdgeInsets.only(top: labelTopOffset),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: _labelFontSize,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(
          width: _colonWidth,
          child: Padding(
            padding: EdgeInsets.only(top: labelTopOffset),
            child: showColon
                ? const Text(
                    ':',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: _labelFontSize, color: Colors.black),
                  )
                : const SizedBox.shrink(),
          ),
        ),
        const SizedBox(width: _rightGap),
        Expanded(child: right),
      ],
    );
  }

  Widget _dottedUnderline() {
    return LayoutBuilder(
      builder: (context, constraints) {
        const double dotWidth = 3;
        const double spacing = 4;
        final int count = (constraints.maxWidth / (dotWidth + spacing)).floor();
        return Row(
          children: List.generate(count, (index) {
            return Container(
              width: dotWidth,
              height: 1,
              margin: const EdgeInsets.only(right: spacing),
              color: _dotColor,
            );
          }),
        );
      },
    );
  }

  Widget _buildDottedInput(String label, TextEditingController controller,
      {String? placeholder}) {
    return _buildTwoColRow(
      label: label,
      labelTopOffset: _labelTopOffset,
      right: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: placeholder ?? '',
              hintStyle:
                  TextStyle(color: _dotColor, fontSize: _valueFontSize),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            ),
            style: const TextStyle(fontSize: _valueFontSize),
          ),
          _dottedUnderline(),
        ],
      ),
    );
  }

  Widget _buildCheckboxGroup(
      String label, List<String> options, String? value, Function(String?) onChanged,
      {CrossAxisAlignment rowAlign = CrossAxisAlignment.center, bool showColon = true}) {
    return _buildTwoColRow(
      label: label,
      labelTopOffset: _labelTopOffset,
      rowAlign: rowAlign,
      showColon: showColon,
      right: Wrap(
        spacing: 12,
        runSpacing: 6,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: options.map((option) {
          return InkWell(
            onTap: () => onChanged(value == option ? null : option),
            borderRadius: BorderRadius.circular(4),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.white,
                    ),
                    child: value == option
                        ? Center(
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          )
                        : null,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    option,
                    style: const TextStyle(
                        fontSize: _valueFontSize, color: Colors.black),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDateInput() {
    return _buildTwoColRow(
      label: '7. Tgl Lahir / Umur',
      labelTopOffset: _labelTopOffset,
      right: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                TextField(
                  controller: _tanggalLahirController,
                  decoration: InputDecoration(
                    hintText: 'Tgl',
                    hintStyle:
                        TextStyle(color: _dotColor, fontSize: _valueFontSize),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: _valueFontSize),
                  textAlign: TextAlign.center,
                ),
                _dottedUnderline(),
              ],
            ),
          ),
          const Text('/', style: TextStyle(fontSize: _valueFontSize)),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                TextField(
                  controller: _bulanLahirController,
                  decoration: InputDecoration(
                    hintText: 'Bln',
                    hintStyle:
                        TextStyle(color: _dotColor, fontSize: _valueFontSize),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: _valueFontSize),
                  textAlign: TextAlign.center,
                ),
                _dottedUnderline(),
              ],
            ),
          ),
          const Text('/', style: TextStyle(fontSize: _valueFontSize)),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                TextField(
                  controller: _tahunLahirController,
                  decoration: InputDecoration(
                    hintText: 'Thn',
                    hintStyle:
                        TextStyle(color: _dotColor, fontSize: _valueFontSize),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: _valueFontSize),
                  textAlign: TextAlign.center,
                ),
                _dottedUnderline(),
              ],
            ),
          ),
          const SizedBox(width: 12),
          const Text('Umur',
              style: TextStyle(fontSize: _valueFontSize, color: Colors.black)),
          const SizedBox(width: 6),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                TextField(
                  controller: _umurController,
                  decoration: InputDecoration(
                    hintText: '....',
                    hintStyle:
                        TextStyle(color: _dotColor, fontSize: _valueFontSize),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: _valueFontSize),
                  textAlign: TextAlign.center,
                ),
                _dottedUnderline(),
              ],
            ),
          ),
          const SizedBox(width: 6),
          const Text('Tahun',
              style: TextStyle(fontSize: _valueFontSize, color: Colors.black)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Data Warga',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDottedInput('Desa Wisma', _desaWismaController, placeholder: 'Masukan Mawar'),
            const SizedBox(height: 16),
            _buildDottedInput('Nama Kepala', _namaKepalaController, placeholder: 'Masukan Kepala Keluarga'),
            const SizedBox(height: 20),
            
            const Text(
              'Rumah Tangga',
              style: TextStyle(fontSize: _labelFontSize, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: _sectionPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDottedInput('1. No. Registrasi', _noRegistrasiController, placeholder: 'Nomor Kepala Keluarga'),
                  const SizedBox(height: 12),
                  _buildDottedInput('2. No. KTP/NIK', _noKtpNikController, placeholder: 'Nomor KTP / NIK'),
                  const SizedBox(height: 12),
                  _buildDottedInput('3. Nama', _namaController, placeholder: 'Nama anggota keluarga'),
                  const SizedBox(height: 12),
                  _buildDottedInput('4. Jabatan', _jabatanController, placeholder: 'Jabatan dalam keluarga'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            
            _buildCheckboxGroup(
              '5. Jenis Kelamin',
              ['Laki-laki', 'Perempuan'],
              _jenisKelamin,
              (value) => setState(() => _jenisKelamin = value),
            ),
            const SizedBox(height: 16),
            
            _buildDottedInput('6. Tempat Lahir', _tempatLahirController, placeholder: 'Cth Purwokerto'),
            const SizedBox(height: 16),
            
            _buildDateInput(),
            const SizedBox(height: 16),
            
            _buildCheckboxGroup(
              '8. Status Perkawinan',
              ['Menikah', 'Lajang', 'Janda', 'Duda'],
              _statusPerkawinan,
              (value) => setState(() => _statusPerkawinan = value),
              rowAlign: CrossAxisAlignment.start,
            ),
            const SizedBox(height: 16),
            
            _buildCheckboxGroup(
              '9. Status Dalam Keluarga',
              ['Kepala Keluarga', 'Anggota Keluarga'],
              _statusDalamKeluarga,
              (value) => setState(() => _statusDalamKeluarga = value),
              rowAlign: CrossAxisAlignment.start,
            ),
            const SizedBox(height: 16),
            
            _buildCheckboxGroup(
              '10. Agama',
              ['Islam', 'Kristen', 'Konhucu', 'Hindu', 'Katolik', 'Budha'],
              _agama,
              (value) => setState(() => _agama = value),
              rowAlign: CrossAxisAlignment.start,
            ),
            const SizedBox(height: 16),
            
            const Text(
              '11. Alamat',
              style: TextStyle(fontSize: _labelFontSize, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: _sectionPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDottedInput('Alamat', _alamatController, placeholder: 'Alamat anda'),
                  const SizedBox(height: 12),
                  _buildCheckboxGroup(
                    'Status Tinggal',
                    ['Mukim', 'Perantauan'],
                    _statusTinggal,
                    (value) => setState(() => _statusTinggal = value),
                  ),
                  const SizedBox(height: 12),
                  _buildDottedInput('Desa / Kel / Sejenis', _desaKelController, placeholder: 'Cth. Pandak'),
                  const SizedBox(height: 12),
                  _buildDottedInput('Kab / Kota', _kabKotaController, placeholder: 'Cth. Banyumas'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            
            _buildCheckboxGroup(
              '12. Pendidikan',
              ['Tidak tamat sd', 'SD / MI', 'SMP / Sederajat', 'SMU / Sederajat',
               'Diploma', 'S1', 'S2', 'S3'],
              _pendidikan,
              (value) => setState(() => _pendidikan = value),
              rowAlign: CrossAxisAlignment.start,
            ),
            const SizedBox(height: 16),
            
            _buildCheckboxGroup(
              '13. Pekerjaan',
              ['Petani', 'Pedagang', 'Wirausaha', 'Swasta', 'TNI / Polri', 'Lainnya'],
              _pekerjaan,
              (value) => setState(() => _pekerjaan = value),
              rowAlign: CrossAxisAlignment.start,
            ),
            const SizedBox(height: 16),

            _buildCheckboxGroup(
              '14. Akseptor KB',
              ['Ya', 'Tidak'],
              _akseptorKb,
              (value) => setState(() => _akseptorKb = value),
            ),
            const SizedBox(height: 8),
            if (_akseptorKb == 'Ya')
              Padding(
                padding: _sectionPadding,
                child: _buildDottedInput('Jenis Akseptor KB', _jenisAkseptorKbController, placeholder: 'Kondom Sutra Merah'),
              ),
            const SizedBox(height: 16),
            
            _buildCheckboxGroup(
              '15. Aktif dalam Posyandu',
              ['Ya', 'Tidak'],
              _aktifPosyandu,
              (value) => setState(() => _aktifPosyandu = value),
            ),
            const SizedBox(height: 8),
            if (_aktifPosyandu == 'Ya')
              Padding(
                padding: _sectionPadding,
                child: _buildDottedInput('Frekuensi / volume', _frekuensiPosyanduController, placeholder: '1'),
              ),
            const SizedBox(height: 16),
            
            _buildCheckboxGroup(
              '16. Mengikuti program bina keluarga balita',
              ['Ya', 'Tidak'],
              _binaBalita,
              (value) => setState(() => _binaBalita = value),
            ),
            const SizedBox(height: 16),
            
            _buildCheckboxGroup(
              '17. Memiliki Tabungan',
              ['Ya', 'Tidak'],
              _memilikiTabungan,
              (value) => setState(() => _memilikiTabungan = value),
              rowAlign: CrossAxisAlignment.start,
            ),
            const SizedBox(height: 8),
            if (_memilikiTabungan == 'Ya')
              Padding(
                padding: _sectionPadding,
                child: _buildCheckboxGroup(
                  '',
                  ['Paket A', 'Paket B', 'Paket C', 'KF'],
                  _paketTabungan,
                  (value) => setState(() => _paketTabungan = value),
                  rowAlign: CrossAxisAlignment.start,
                  showColon: false,
                ),
              ),
            const SizedBox(height: 16),
            
            _buildCheckboxGroup(
              '18. Mengikuti PAUD',
              ['Ya', 'Tidak'],
              _ikutPaud,
              (value) => setState(() => _ikutPaud = value),
            ),
            const SizedBox(height: 16),
            
            _buildCheckboxGroup(
              '19. Ikut dalam kegiatan koperasi',
              ['Ya', 'Tidak'],
              _ikutKoperasi,
              (value) => setState(() => _ikutKoperasi = value),
            ),
            const SizedBox(height: 16),
            
            _buildCheckboxGroup(
              '20. Berkebutuhan Khusus',
              ['Ya', 'Tidak'],
              _berkebutuhanKhusus,
              (value) => setState(() => _berkebutuhanKhusus = value),
            ),
            const SizedBox(height: 32),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: const Icon(Icons.delete_outline, size: 20),
                  label: const Text('Hapus Data'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2C4A7C),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: const Icon(Icons.save_outlined, size: 20),
                  label: const Text('Simpan Data'),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}