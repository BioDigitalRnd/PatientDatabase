DROP DATABASE IF EXISTS "Patient_data";
CREATE DATABASE Patient_data;
USE Patient_data;

CREATE TABLE Patient_General (
	id BIGSERIAL PRIMARY KEY NOT NULL unique,
	entered_into_system TIMESTAMP NOT NULL,
	name VARCHAR(255) NOT NULL,
	gender VARCHAR(10) NOT NULL,
	age INT, -- age can be calculated from date of birth
	date_of_birth DATE NOT NULL,
	race_and_ethnicity VARCHAR(100) NOT NULL,
	orientation VARCHAR(50),
	blood_type VARCHAR(3) NOT NULL
);

CREATE TABLE Patient_PhysicalProfile (
	id BIGSERIAL PRIMARY KEY NOT NULL unique,
	height DECIMAL(5,2) NOT NULL,
	weight DECIMAL(5,2) NOT NULL,
	body_mass_index DECIMAL(5,2), -- body mass index can be calculated from height and weight
	allergies VARCHAR(100) NOT NULL
	-- allergic_reaction VARCHAR(255) NOT NULL -- subtable of allergies 
);

CREATE TABLE Patient_Lifestyle (
	id BIGSERIAL PRIMARY KEY NOT NULL unique,
	body_mass_index DECIMAL,
    -- FOREIGN KEY (body_mass_index) REFERENCES Patient_PhysicalProfile(body_mass_index),
	diet VARCHAR(100),
	smoking VARCHAR(20),
	drinking VARCHAR(20),
	exercise VARCHAR(50),
	HoursOfSleep VARCHAR(30) -- contains subtables for different sleep parameters
);

CREATE TABLE Patient_Records (
	id BIGSERIAL PRIMARY KEY NOT NULL unique,
    FOREIGN KEY (race_and_ethnicity) REFERENCES Patient_General(race_and_ethnicity),
	medical_history VARCHAR(100), -- contains subtables
	medication_history VARCHAR(100), -- contains subtables
	review_of_systems VARCHAR(100), -- contains subtables
	family_history VARCHAR(100), -- contains subtables
	menstrual_history VARCHAR(100) -- contains subtables
);

CREATE TABLE Patient_Lifestyle2 (
	id BIGSERIAL PRIMARY KEY NOT NULL unique,
	FOREIGN KEY (gender) REFERENCES Patient_General(gender),
	occupation VARCHAR(50),
	marital_status VARCHAR(30),
	sexual_activity VARCHAR(30),
	birth_control_method VARCHAR(25)
);

CREATE TABLE Patient_Stage1_Parameters (
	id BIGSERIAL PRIMARY KEY NOT NULL unique,
	FOREIGN KEY (body_mass_index)  REFERENCES Patient_PhysicalProfile(body_mass_index),
	FOREIGN KEY (medical_history) REFERENCES Patient_Records(medical_history),
	pulse VARCHAR(10),
	oxygen_saturation VARCHAR(20),
	blood_pressure VARCHAR(15),
	body_temperature VARCHAR(25),
	fall_detection VARCHAR(30),
	cardiac_monitoring VARCHAR(30),
	sleep_pattern VARCHAR(50),
	respiratory_rate VARCHAR(20),
	vertigo_mitigation VARCHAR(25)
);

CREATE TABLE Patient_Stage2_Parameters (
	id BIGSERIAL PRIMARY KEY NOT NULL unique,
	FOREIGN KEY (blood_pressure, body_temperature) REFERENCES Patient_Stage1_Parameters(blood_pressure, body_temperature),
	body_temperature VARCHAR(25),
	consciousness_state VARCHAR(30),
	seziure_indications VARCHAR(30),
	stroke_indications VARCHAR(30),
	pain_intensity_level VARCHAR(50),
	blood_glucose_level VARCHAR(20),
	sepsis_detection VARCHAR(25),
	catabolic_muscle_loss VARCHAR(30),
	electrolyte_imbalance VARCHAR(25) 
);

-- subtables (Medical records, review of systems etc.)

create table Allergies(
id BIGSERIAL PRIMARY KEY NOT NULL unique,
Allergies int, --foreign key
Allergy text not null,
AllergicReactions text,
Prevention text,
AgeIdentified text --Age Allergy was Identified
);

create table SleepPattern(
id BIGSERIAL PRIMARY KEY NOT NULL unique,
HoursOfSleep varchar(20) not null, --foreign key
SleepCycle text,
Average text,
MedicationsNeeded text --medications needed for sleep
);

create table MedicalRecords(
id BIGSERIAL PRIMARY KEY NOT NULL unique,
MedicalHistory text not null, --foreign key
SignificantPastDnI text, --significant pass disease and Illnesses
Surgery text, --including Complications
HistoryOfTrauma text
);

create table MedicationRecords(
id BIGSERIAL PRIMARY KEY NOT NULL unique,
MedicationHistory text not null, --foreign key
Medication text, 
Dose Varchar(10),
NumberOftimesPerDay int,
PastMedications text,
OvertheCounter text
);

create table ReviewOfSystems(
id BIGSERIAL PRIMARY KEY NOT NULL unique,
ReviewOfSystems text not null, --foreign key
General text, 
HeadNEarNNoseNThroat text, -- put into another sub table
Eyes text,
Respiratory text,
Cardiovascular text,
Endocrine text,
Muscular varchar(50)
);

create table Ancestry(
id BIGSERIAL PRIMARY KEY NOT NULL unique,
FamilyHistory text not null, --foreign key
BloodRelations text, 
Diabetes text, 
HighbloodPressure text,
Angina text,
MyoCardialInfarction text,
Stroke text,
Copd text,
Asthma text,
ParkingsonsDisease text,
Epilepsy text,
AlzheimersDisease text,
Throid text
);

CREATE TABLE Patient_Medical_Records (
	id BIGSERIAL PRIMARY KEY NOT NULL unique,
	past_diseases_and_illnesses TEXT,
	surgeries_and_complications TEXT,
	history_of_trauma TEXT
);

CREATE TABLE Patient_Review_of_Systems (
	id BIGSERIAL PRIMARY KEY NOT NULL unique,
	general TEXT,
	head_ear_nose_throat TEXT,
	eyes TEXT,
	respiratory TEXT,
	cadiovascular TEXT,
	endocrine TEXT,
	muscular TEXT,
	skin TEXT,
	allergy_immuno TEXT,
	neurological TEXT,
	hematological TEXT,
	psychiatric TEXT,
	geriartric_giants TEXT
);

