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
begin
end.