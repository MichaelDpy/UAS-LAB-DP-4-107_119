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

begin
end.