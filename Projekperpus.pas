program manajemen_buku_perpustakaan
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
// Prosedur untuk menambah buku
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
// Prosedur untuk menampilkan semua buku
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
    readln; // Menunggu pengguna menekan Enter sebelum kembali ke menu
end;
begin
end.