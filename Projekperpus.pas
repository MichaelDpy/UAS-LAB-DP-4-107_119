program manajemen_buku_perpustakaan;
uses crt;
const
    MAX_BUKU = 100;

type
    Buku = record
        judul: string[100];
        penulis: string[50];
        tahun: integer;
        kode: string[20];
        jumlah: integer;
    end;

var
    daftarBuku: array[1..MAX_BUKU] of Buku;
    jumlahBuku: integer;
    pilihan: integer;
//prosedur untuk menambah buku
procedure TambahBuku;
var
    bukuBaru: Buku;
begin
    if jumlahBuku < MAX_BUKU then
    begin
        writeln('=== Tambah Buku ===');
        write('Masukkan Judul Buku: ');
        readln(bukuBaru.judul);
        write('Masukkan Penulis Buku: ');
        readln(bukuBaru.penulis);
        write('Masukkan Tahun Terbit: ');
        readln(bukuBaru.tahun);
        write('Masukkan Kode Buku: ');
        readln(bukuBaru.kode);
        write('Masukkan Jumlah Buku: ');
        readln(bukuBaru.jumlah);
        
        inc(jumlahBuku);
        daftarBuku[jumlahBuku] := bukuBaru;
        writeln('Buku berhasil ditambahkan!');
    end
    else
        writeln('Daftar buku sudah penuh!');
end;
//prosedur untuk menampilkan semua buku
procedure TampilkanBuku;
var
    i: integer;
begin
    writeln('=== Daftar Buku ===');
    if jumlahBuku = 0 then
        writeln('Tidak ada buku dalam daftar.')
    else
    begin
        for i := 1 to jumlahBuku do
        begin
            writeln('Buku ke-', i);
            writeln('Judul: ', daftarBuku[i].judul);
            writeln('Penulis: ', daftarBuku[i].penulis);
            writeln('Tahun Terbit: ', daftarBuku[i].tahun);
            writeln('Kode: ', daftarBuku[i].kode);
            writeln('Jumlah: ', daftarBuku[i].jumlah);
            writeln('-------------------');
        end;
    end;
    writeln('Tekan Enter untuk kembali ke menu utama...');
    readln; //menunggu pengguna menekan Enter sebelum kembali ke menu
end;
//prosedur untuk mencari buku
procedure CariBuku;
var
    judulCari: string;
    i: integer;
    ditemukan: boolean;
begin
    writeln('=== Cari Buku ===');
    write('Masukkan Judul Buku yang dicari: ');
    readln(judulCari);
    ditemukan := false;

    for i := 1 to jumlahBuku do
    begin
        if daftarBuku[i].judul = judulCari then
        begin
            ditemukan := true;
            writeln('Buku ditemukan!');
            writeln('Judul: ', daftarBuku[i].judul);
            writeln('Penulis: ', daftarBuku[i].penulis);
            writeln('Tahun Terbit: ', daftarBuku[i].tahun);
            writeln('Kode: ', daftarBuku[i].kode);
            writeln('Jumlah: ', daftarBuku[i].jumlah);
            break;
        end;
    end;

    if not ditemukan then
        writeln('Buku dengan judul tersebut tidak ditemukan.');
    writeln('Tekan Enter untuk kembali ke menu utama...');
    readln; //menunggu pengguna menekan Enter sebelum kembali ke menu
end;
// Prosedur untuk mengedit buku
procedure EditBuku;
var
    kodeCari: string;
    i: integer;
    ditemukan: boolean;
begin
    writeln('=== Edit Buku ===');
    write('Masukkan Kode Buku yang ingin diedit: ');
    readln(kodeCari);
    ditemukan := false;

    for i := 1 to jumlahBuku do
    begin
        if daftarBuku[i].kode = kodeCari then
        begin
            ditemukan := true;
            writeln('Buku ditemukan!');
            writeln('Judul: ', daftarBuku[i].judul);
            writeln('Penulis: ', daftarBuku[i].penulis);
            writeln('Tahun Terbit: ', daftarBuku[i].tahun);
            writeln('Jumlah: ', daftarBuku[i].jumlah);
            
            write('Masukkan Judul Baru: ');
            readln(daftarBuku[i].judul);
            write('Masukkan Penulis Baru: ');
            readln(daftarBuku[i].penulis);
            write('Masukkan Tahun Terbit Baru: ');
            readln(daftarBuku[i].tahun);
            write('Masukkan Jumlah Baru: ');
            readln(daftarBuku[i].jumlah);
            
            writeln('Buku berhasil diperbarui!');
            break;
        end;
    end;

    if not ditemukan then
        writeln('Buku dengan kode tersebut tidak ditemukan.');
    writeln('Tekan Enter untuk kembali ke menu utama...');
    readln; // Menunggu pengguna menekan Enter sebelum kembali ke menu
end;
//prosedur untuk menghapus buku
procedure HapusBuku;
var
    kodeHapus: string;
    i, j: integer;
    ditemukan: boolean;
begin
    writeln('=== Hapus Buku ===');
    write('Masukkan Kode Buku yang ingin dihapus: ');
    readln(kodeHapus);
    ditemukan := false;

    for i := 1 to jumlahBuku do
    begin
        if daftarBuku[i].kode = kodeHapus then
        begin
            ditemukan := true;
            for j := i to jumlahBuku - 1 do
                daftarBuku[j] := daftarBuku[j + 1];
            dec(jumlahBuku);
            writeln('Buku berhasil dihapus!');
            break;
        end;
    end;

    if not ditemukan then
        writeln('Buku dengan kode tersebut tidak ditemukan.');
    writeln('Tekan Enter untuk kembali ke menu utama...');
    readln; //menunggu pengguna menekan Enter sebelum kembali ke menu
end;
begin
    jumlahBuku := 0; // Inisialisasi jumlah buku
    repeat
        writeln('=== Menu Utama ===');
        writeln('1. Tambah Buku');
        writeln('2. Tampilkan Daftar Buku');
        writeln('3. Cari Buku');
        writeln('4. Edit Buku');
        writeln('5. Hapus Buku');
        writeln('6. Keluar');
        write('Pilih opsi: ');
        readln(pilihan);

        case pilihan of
            1: TambahBuku;
            2: TampilkanBuku;
            3: CariBuku;
            4: EditBuku;
            5: HapusBuku;
            6: writeln('Terima kasih! Sampai jumpa!');
        else
            writeln('Pilihan tidak valid! Silakan coba lagi.');
        end;
    until pilihan = 6;
end.