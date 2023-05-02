CREATE DATABASE dossier_medical;

CREATE TABLE Patient (
    NISS INT PRIMARY KEY,
    Nom VARCHAR(255) NOT NULL,
    Prenom VARCHAR(255) NOT NULL,
    Gendre VARCHAR(50) NOT NULL,
    Date_de_naissance DATE NOT NULL,
    Adresse_mail VARCHAR(255) NOT NULL,
    Numero_de_telephone VARCHAR(20) NOT NULL,
    Numero_INAMI_medecin INT,
    Numero_INAMI_pharmacien INT
);

CREATE TABLE Medecin (
    Numero_INAMI INT PRIMARY KEY,
    Nom VARCHAR(255) NOT NULL,
    Specialite VARCHAR(255) NOT NULL,
    Systeme_anatomique VARCHAR(255) NOT NULL,
    Numero_de_telephone VARCHAR(20) NOT NULL,
    Adresse_mail VARCHAR(255) NOT NULL
);

CREATE TABLE Pharmacien (
    Numero_INAMI INT PRIMARY KEY,
    Nom VARCHAR(255) NOT NULL,
    Numero_de_telephone VARCHAR(20) NOT NULL,
    Adresse_mail VARCHAR(255) NOT NULL
);

CREATE TABLE Pathologie (
    ID_Pathologie INT PRIMARY KEY,
    Nom VARCHAR(255) NOT NULL,
    Systeme_anatomique VARCHAR(255) NOT NULL,
    Date_de_diagnostic DATE NOT NULL,
    NISS INT,
    FOREIGN KEY (NISS) REFERENCES Patient(NISS)
);

CREATE TABLE Medicament (
    Nom_DCI VARCHAR(255) PRIMARY KEY,
    Nom_commercial VARCHAR(255) NOT NULL,
    Conditionnement VARCHAR(255) NOT NULL
);

CREATE TABLE Prescription (
    ID_Prescription INT PRIMARY KEY,
    Date_de_prescription DATE NOT NULL,
    Duree_de_traitement INT NOT NULL,
    NISS INT,
    Numero_INAMI INT,
    Nom_DCI VARCHAR(255),
    FOREIGN KEY (NISS) REFERENCES Patient(NISS),
    FOREIGN KEY (Numero_INAMI) REFERENCES Medecin(Numero_INAMI),
    FOREIGN KEY (Nom_DCI) REFERENCES Medicament(Nom_DCI)
);

CREATE TABLE Traitement (
    Date_de_debut DATE NOT NULL,
    Duree INT NOT NULL,
    NISS INT,
    Numero_INAMI INT,
    Nom_DCI VARCHAR(255),
    ID_Prescription INT,
    ID_Pathologie INT,
    FOREIGN KEY (NISS) REFERENCES Patient(NISS),
    FOREIGN KEY (Numero_INAMI) REFERENCES Medecin(Numero_INAMI),
    FOREIGN KEY (Nom_DCI) REFERENCES Medicament(Nom_DCI),
    FOREIGN KEY (ID_Prescription) REFERENCES Prescription(ID_Prescription),
    FOREIGN KEY (ID_Pathologie) REFERENCES Pathologie(ID_Pathologie)
);
