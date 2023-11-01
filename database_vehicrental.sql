CREATE DATABASE vehicrental;

USE vehicrental;

-- clients
CREATE TABLE IF NOT EXISTS Clients(
    ID_Client VARCHAR(10) UNIQUE NOT NULL,
    ID_Staff VARCHAR(10) UNIQUE NOT NULL,
    NIK_Client VARCHAR(16) UNIQUE NOT NULL,
    Nama_Client VARCHAR(25) NOT NULL,
    Alamat_Client TINYTEXT,
    JenisKelamin_Client ENUM('P','L'),
    Umur_Client VARCHAR(3),
    NoSIM_Client VARCHAR(16) NOT NULL,
    Email_Client VARCHAR(25),
    PRIMARY KEY (ID_Client),
    CONSTRAINT FK_ClientStaff FOREIGN KEY (ID_Staff) REFERENCES Staff(ID_Staff)
);

DESCRIBE Clients;

INSERT INTO Clients (ID_Client, ID_Staff, NIK_Client, Nama_Client, Alamat_Client, JenisKelamin_Client, Umur_Client, NoSIM_Client, Email_Client)
VALUES
    ('CL001', 'ST001', '1234567890', 'John Doe', 'Jl. Contoh 123', 'L', '30', '1234567890123456', 'john.doe@example.com'),
    ('CL002', 'ST002', '9876543210', 'Jane Smith', 'Jl. Contoh 456', 'P', '28', '98765432109876', 'jane.smith@example.com'),
    ('CL003', 'ST003', '5555555555', 'Mary Johnson', 'Jl. Contoh 789', 'L', '35', '5555555555555555', 'mary@example.com'),
    ('CL004', 'ST004', '6666666666', 'David Lee', 'Jl. Contoh 1011', 'L', '32', '6666666666666666', 'david@example.com'),
    ('CL005', 'ST005', '7777777777', 'Sarah Miller', 'Jl. Contoh 1213', 'P', '29', '7777777777777777', 'sarah@example.com');

-- regent
CREATE TABLE IF NOT EXISTS Regent(
    ID_Regent VARCHAR(10) UNIQUE NOT NULL,
    ID_Staff VARCHAR(10) UNIQUE NOT NULL,
    NIK_Regent VARCHAR(16) UNIQUE NOT NULL,
    Nama_Regent VARCHAR(25) NOT NULL,
    Alamat_Regent TINYTEXT,
    JenisKelamin_Regent ENUM('P','L'),
    Umur_Regent VARCHAR(3),
    Norek_Regent VARCHAR(14),
    Email_Regent VARCHAR(25),
    PRIMARY KEY (ID_Regent),
    CONSTRAINT FK_RegentStaff FOREIGN KEY (ID_Staff) REFERENCES Staff(ID_Staff)
);

DESCRIBE Regent;

INSERT INTO Regent (ID_Regent, ID_Staff, NIK_Regent, Nama_Regent, Alamat_Regent, JenisKelamin_Regent, Umur_Regent, Norek_Regent, Email_Regent)
VALUES
    ('RG001', 'ST001', '1234567890', 'Robert Smith', 'Jl. Regent 123', 'L', '30', '12345678901234', 'robert@example.com'),
    ('RG002', 'ST002', '9876543210', 'Rebecca Johnson', 'Jl. Regent 456', 'P', '28', '987654321098', 'rebecca@example.com'),
    ('RG003', 'ST003', '5555555555', 'Richard Lee', 'Jl. Regent 789', 'L', '35', '55555555555555', 'richard@example.com'),
    ('RG004', 'ST004', '6666666666', 'Rita Davis', 'Jl. Regent 1011', 'P', '32', '66666666666666', 'rita@example.com'),
    ('RG005', 'ST005', '7777777777', 'Ronald Miller', 'Jl. Regent 1213', 'L', '29', '77777777777777', 'ronald@example.com');

-- transaksi
CREATE TABLE IF NOT EXISTS Transaksi(
    ID_Transaksi VARCHAR(10) UNIQUE NOT NULL,
    ID_Regent VARCHAR(10) UNIQUE NOT NULL,
    ID_Client VARCHAR(10) UNIQUE NOT NULL,
    ID_Kendaraan VARCHAR(10) UNIQUE NOT NULL,
    ID_Staff VARCHAR(10) UNIQUE NOT NULL,
    Waktu_Pemesanan TIMESTAMP NOT NULL,
    HargaTotal_Pemesanan INT,
    Status_Pemesanan VARCHAR(10) NOT NULL,
    PRIMARY KEY (ID_Transaksi),
    CONSTRAINT FK_Regent_Transaksi FOREIGN KEY(ID_Regent) REFERENCES Regent(ID_Regent),
    CONSTRAINT FK_Client_Transaksi FOREIGN KEY(ID_Client) REFERENCES Clients(ID_Client),
    CONSTRAINT FK_Kendaraan_Transaksi FOREIGN KEY(ID_Kendaraan) REFERENCES Kendaraan(ID_Kendaraan),
    CONSTRAINT FK_Staff_Transaksi FOREIGN KEY(ID_Staff) REFERENCES Staff(ID_Staff)
);

DESCRIBE Transaksi;

INSERT INTO Transaksi (ID_Transaksi, ID_Regent, ID_Client, ID_Kendaraan, ID_Staff, Waktu_Pemesanan, HargaTotal_Pemesanan, Status_Pemesanan)
VALUES
    ('TR001', 'RG001', 'CL001', 'KD001', 'ST001', NOW(), 150000, 'Selesai'),
    ('TR002', 'RG002', 'CL002', 'KD002', 'ST002', NOW(), 175000, 'Selesai'),
    ('TR003', 'RG003', 'CL003', 'KD003', 'ST003', NOW(), 120000, 'Selesai'),
    ('TR004', 'RG004', 'CL004', 'KD004', 'ST004', NOW(), 132000, 'Selesai'),
    ('TR005', 'RG005', 'CL005', 'KD005', 'ST005', NOW(), 140000, 'Selesai');

-- kendaraan
CREATE TABLE IF NOT EXISTS Kendaraan(
    ID_Kendaraan VARCHAR(10) UNIQUE NOT NULL,
    ID_Regent VARCHAR(10) UNIQUE NOT NULL,
    ID_Staff VARCHAR(10) UNIQUE NOT NULL,
    ID_Client VARCHAR(10) UNIQUE NOT NULL,
    Jenis_Kendaraan VARCHAR(15) NOT NULL,
    Nopol_Kendaraan VARCHAR (10) NOT NULL,
    Merek_Kendaraan VARCHAR(10) NOT NULL,
    Tahun_Kendaraan VARCHAR(4) NOT NULL,
    Warna_Kendaraan VARCHAR(10),
    NoSTNK_Kendaraan VARCHAR(17) NOT NULL,
    NoMesin_Kendaraan VARCHAR(12) NOT NULL,
    Kapasitas_Kendaraan VARCHAR(2) NOT NULL,
    HargaPerjam_Kendaraan INT NOT NULL,
    MaksimalWaktu_Kendaraan VARCHAR(10) NOT NULL,
    Status_Kendaraan VARCHAR(10) NOT NULL,
    PRIMARY KEY (ID_Kendaraan),
    CONSTRAINT FK_Regent FOREIGN KEY(ID_Regent) REFERENCES Regent(ID_Regent),
    CONSTRAINT FK_Client FOREIGN KEY(ID_Client) REFERENCES Clients(ID_Client),
    CONSTRAINT FK_KendaraanStaff FOREIGN KEY (ID_Staff) REFERENCES Staff(ID_Staff)
);

Describe Kendaraan;

INSERT INTO Kendaraan (ID_Kendaraan, ID_Regent, ID_Staff, ID_Client, Jenis_Kendaraan, Nopol_Kendaraan, Merek_Kendaraan, Tahun_Kendaraan, Warna_Kendaraan, NoSTNK_Kendaraan, NoMesin_Kendaraan, Kapasitas_Kendaraan, HargaPerjam_Kendaraan, MaksimalWaktu_Kendaraan, Status_Kendaraan)
VALUES
    ('KD001', 'RG001', 'ST001', 'CL001', 'Sedan', 'B 1234 AB', 'Toyota', '2022', 'Silver', '12345678901234567', 'ABCDE123456', '4', 50000, '24 jam', 'Tersedia'),
    ('KD002', 'RG002', 'ST002', 'CL002', 'SUV', 'D 5678 CD', 'Honda', '2021', 'Red', '98765432109876543', 'XYZW987654', '6', 75000, '12 jam', 'Tersedia'),
    ('KD003', 'RG003', 'ST003', 'CL003', 'Hatchback', 'E 9012 EF', 'Ford', '2023', 'Blue', '55555555555555555', 'LMNOP555555', '5', 60000, '24 jam', 'Tersedia'),
    ('KD004', 'RG004', 'ST004', 'CL004', 'Sedan', 'F 3456 FG', 'Nissan', '2022', 'Black', '66666666666666666', 'QRSTUV666666', '4', 55000, '12 jam', 'Tersedia'),
    ('KD005', 'RG005', 'ST005', 'CL005', 'SUV', 'G 7890 GH', 'Kia', '2023', 'Green', '77777777777777777', 'IJKL777777', '6', 70000, '24 jam', 'Tersedia');

-- pembayaran
CREATE TABLE IF NOT EXISTS Pembayaran(
    ID_Pembayaran VARCHAR(10) UNIQUE NOT NULL,
    ID_Transaksi VARCHAR(10) UNIQUE NOT NULL,
    Metode_Payment VARCHAR(20) NOT NULL,
    Waktu_Payment TIMESTAMP NOT NULL,
    PRIMARY KEY(ID_Pembayaran),
    CONSTRAINT FK_Transaksi FOREIGN KEY(ID_Transaksi) REFERENCES Transaksi(ID_Transaksi)
);

DESCRIBE Pembayaran;

INSERT INTO Pembayaran (ID_Pembayaran, ID_Transaksi, Metode_Payment, Waktu_Payment)
VALUES
    ('PM001', 'TR001', 'Transfer Bank', NOW()),
    ('PM002', 'TR002', 'Kartu Kredit', NOW()),
    ('PM003', 'TR003', 'Tunai', NOW()),
    ('PM004', 'TR004', 'Transfer Bank', NOW()),
    ('PM005', 'TR005', 'Kartu Kredit', NOW());

-- staff
CREATE TABLE IF NOT EXISTS Staff(
    ID_Staff  VARCHAR(10) UNIQUE NOT NULL,
    NIK_Staff VARCHAR(16) UNIQUE NOT NULL,
    Nama_Staff VARCHAR(25) NOT NULL,
    Alamat_Staff TINYTEXT,
    JenisKelamin_Staff ENUM('P','L'),
    Umur_Staff VARCHAR(3),
    Email_Staff VARCHAR(25),
    PRIMARY KEY(ID_Staff)
);

DESCRIBE Staff;

INSERT INTO Staff (ID_Staff, NIK_Staff, Nama_Staff, Alamat_Staff, JenisKelamin_Staff, Umur_Staff, Email_Staff)
VALUES
    ('ST001', '1111111111', 'Alex Johnson', 'Jl. Staff 123', 'L', '25', 'alex@example.com'),
    ('ST002', '2222222222', 'Brian Smith', 'Jl. Staff 456', 'L', '28', 'brian@example.com'),
    ('ST003', '3333333333', 'Catherine Lee', 'Jl. Staff 789', 'P', '30', 'catherine@example.com'),
    ('ST004', '4444444444', 'Daniel Davis', 'Jl. Staff 1011', 'L', '32', 'daniel@example.com'),
    ('ST005', '5555555555', 'Emily Miller', 'Jl. Staff 1213', 'P', '29', 'emily@example.com');

-- rekomendasi
CREATE TABLE IF NOT EXISTS Rekomendasi(
    ID_Rekomendasi VARCHAR(10) UNIQUE NOT NULL,
    ID_Transaksi VARCHAR(10) UNIQUE NOT NULL,
    PRIMARY KEY(ID_Rekomendasi),
    CONSTRAINT FK_TransaksiRekomendasi FOREIGN KEY(ID_Transaksi) REFERENCES Transaksi(ID_Transaksi)
);

DESCRIBE Rekomendasi;

INSERT INTO Rekomendasi (ID_Rekomendasi, ID_Transaksi)
VALUES
    ('RC001', 'TR001'),
    ('RC002', 'TR002'),
    ('RC003', 'TR003'),
    ('RC004', 'TR004'),
    ('RC005', 'TR005');
