DROP DATABASE IF EXISTS `bioluminuex_patient`;
CREATE DATABASE `bioluminuex_patient`; 
USE `bioluminuex_patient`;

-- DROP TABLE IF EXISTS `Patient_General`;
CREATE TABLE Patient_General (
	id SERIAL PRIMARY KEY NOT NULL,
	-- entered_into_system TIMESTAMP NOT NULL,
	name VARCHAR(255),
	gender VARCHAR(10) NOT NULL,
	age int, -- age can be calculated from date of birth
	date_of_birth DATE NOT NULL,
	race_and_ethnicity VARCHAR(100) NOT NULL,
	orientation VARCHAR(50),
	blood_type VARCHAR(3) NOT NULL
);

INSERT INTO Patient_General (name, gender, age, date_of_birth, race_and_ethnicity, orientation, blood_type)
			VALUES	('John Smith', 'Male', '35', '1985-12-12', 'White', 'Heterosexual','O'),
					('Jane Smith', 'Female', '35', '1985-12-12', 'White', 'Heterosexual','A'),
					('Brandon Escabor', 'Male', '31', '1989-10-03', 'Latin', 'Heterosexual','AB'),
					('Cassidy Kleivert', 'Female', '25', '1996-05-19', 'Asian', 'Heterosexual','B');

-- DROP TABLE IF EXISTS `Patient_PhysicalProfile`;
CREATE TABLE Patient_PhysicalProfile (
	id SERIAL PRIMARY KEY NOT NULL,
	height DECIMAL(3,2) NOT NULL,
	weight DECIMAL(4,2) NOT NULL,
	body_mass_index DECIMAL(3,1), -- body mass index can be calculated from height and weight
	allergies VARCHAR(100)
	-- allergic_reaction VARCHAR(255) NOT NULL -- subtable of allergies
);

INSERT INTO Patient_PhysicalProfile (height, weight, body_mass_index, allergies)
			VALUES	('1.86', '87', '25.1', 'nut'),
					('1.60', '53', '20.7', 'gluten'),
                    ('1.80', '74', '22.8', null),
                    ('1.50', '49', '21.8', null);

CREATE TABLE Patient_Lifestyle (
	id SERIAL PRIMARY KEY NOT NULL,
    -- FOREIGN KEY (body_mass_index) REFERENCES Patient_PhysicalProfile(body_mass_index),
	diet VARCHAR(100),
	smoking VARCHAR(20),
	drinking VARCHAR(20),
	exercise VARCHAR(50),
	sleeping VARCHAR(30) -- contains subtables for different sleep parameters
);
INSERT INTO Patient_Lifestyle (diet, smoking, drinking, exercise, sleeping)
			VALUES	('vegan', 'non-smoker', 'light', 'regular', '7'),
					('vegetarian', 'smoker', 'regular', 'occasional', '6'),
                    ('balanced', 'non-smoker', null, 'regular', '8'),
                    ('balanced', null, 'regular', 'occasional', '6');
            
CREATE TABLE Patient_Records (
	id SERIAL PRIMARY KEY NOT NULL,
    -- FOREIGN KEY (race_and_ethnicity) REFERENCES Patient_General(race_and_ethnicity),
	medical_history VARCHAR(100), -- contains subtables
	medication_history VARCHAR(100), -- contains subtables
	review_of_systems VARCHAR(100), -- contains subtables
	family_history VARCHAR(100), -- contains subtables
	menstrual_history VARCHAR(100) -- contains subtables
);
INSERT INTO Patient_Records (medical_history, medication_history, review_of_systems, family_history, menstrual_history)
			VALUES	('cataract surgery', 'none', 'stable', 'father cancer', null),
					('none', 'paracetamol', 'stable', 'grandfather cancer', 'menopause'),
                    (null, 'enhancement', 'fluctuating', null, null),
                    ('asthma', 'paracetamol', 'stable', null, 'pre-menopause');

CREATE TABLE Patient_Lifestyle2 (
	id SERIAL PRIMARY KEY NOT NULL,
	-- FOREIGN KEY (gender) REFERENCES Patient_General(gender),
	occupation VARCHAR(50),
	marital_status VARCHAR(30),
	sexual_activity VARCHAR(30),
	birth_control_method VARCHAR(25)
);
INSERT INTO Patient_Lifestyle2 (occupation, marital_status, sexual_activity, birth_control_method)
			VALUES	('Lawyer', 'married', 'occasional', null),
					('Teacher', 'married', 'occasional', 'contraceptive'),
                    ('Construction', 'engaged', 'frequent', null),
                    ('Sales Assistant', 'single', null, null);

CREATE TABLE Patient_Stage1_Parameters (
	id SERIAL PRIMARY KEY NOT NULL,
	-- FOREIGN KEY (body_mass_index)  REFERENCES Patient_PhysicalProfile(body_mass_index),
	-- FOREIGN KEY (medical_history) REFERENCES Patient_Records(medical_history),
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
	id SERIAL PRIMARY KEY NOT NULL,
	-- FOREIGN KEY (blood_pressure, body_temperature) REFERENCES Patient_Stage1_Parameters(blood_pressure, body_temperature),
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

/*CREATE TABLE Patient_Medical_Records (
	id SERIAL PRIMARY KEY NOT NULL,
	past_diseases_and_illnesses TEXT,
	surgeries_and_complications TEXT,
	history_of_trauma TEXT
);

CREATE TABLE Patient_Review_of_Systems (
	id SERIAL PRIMARY KEY NOT NULL,
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
    );/*