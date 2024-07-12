# housekeeping_directory

Penjelasan Script Shell
Shebang (#!/bin/bash):

Baris pertama #!/bin/bash menunjukkan bahwa script ini menggunakan bash sebagai interpreternya.
Function confirm_deletion():

Ini adalah sebuah fungsi yang bertujuan untuk mengonfirmasi penghapusan direktori dengan input dari pengguna.
Parameter: Fungsi ini menerima satu parameter, yaitu directory, yang merupakan path dari direktori yang akan dihapus.
Pernyataan read: Menggunakan read -r -p untuk menampilkan pesan kepada pengguna dan menunggu input dari pengguna untuk menentukan apakah pengguna ingin melanjutkan penghapusan atau tidak.
Pernyataan case: Menggunakan case "$response" in untuk menangani respons pengguna terhadap konfirmasi penghapusan.
Jika pengguna mengetikkan y atau Y, maka pesan "Confirmed: Deleting directory." ditampilkan dan fungsi mengembalikan nilai 0, yang menandakan bahwa penghapusan dapat dilanjutkan.
Jika pengguna tidak mengetikkan y atau Y, maka pesan "Deletion cancelled." ditampilkan dan fungsi mengembalikan nilai 1, yang menandakan bahwa penghapusan tidak akan dilanjutkan.
Array directories:

Ini adalah sebuah array yang berisi path dari direktori-direktori yang akan dihapus.
Setiap elemen dalam array directories merupakan path dari sebuah direktori yang akan dihapus.
Loop for directory in "${directories[@]}":

Loop ini akan mengiterasi melalui setiap elemen dalam array directories.
Untuk setiap direktori, fungsi confirm_deletion() dipanggil untuk mengonfirmasi apakah pengguna ingin melanjutkan penghapusan atau tidak.
Jika penghapusan dikonfirmasi (confirm_deletion "$directory" mengembalikan 0), maka direktori tersebut akan dihapus menggunakan perintah rm -rf "$directory".
Jika penghapusan gagal (rm -rf "$directory" mengembalikan non-0), maka pesan error akan ditampilkan dan script akan keluar dengan status 1.
Pernyataan echo "Deletion completed successfully.":

Jika semua direktori berhasil dihapus tanpa ada masalah, pesan ini akan ditampilkan di akhir untuk memberi tahu pengguna bahwa proses penghapusan telah selesai dengan sukses.
Ringkasan
Script ini berfungsi untuk menghapus beberapa direktori yang sudah ditentukan, dengan mengonfirmasi setiap penghapusan kepada pengguna sebelum melanjutkan. Jika pengguna membatalkan penghapusan pada salah satu direktori, penghapusan untuk direktori tersebut akan dilewati dan script akan melanjutkan ke direktori berikutnya. Jika ada kesalahan saat menghapus direktori (misalnya karena izin atau direktori tidak ada), script akan menampilkan pesan error dan menghentikan proses dengan status keluar 1.
