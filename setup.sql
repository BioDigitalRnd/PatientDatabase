CREATE TABLE Patient_General (
	id BIGSERIAL PRIMARY KEY NOT NULL,
	entered_into_system TIMESTAMP NOT NULL,
	name VARCHAR(255),
	gender VARCHAR(10) NOT NULL,
	age int(3), -- age can be calculated from date of birth
	date_of_birth DATE NOT NULL,
	race_and_ethnicity VARCHAR(100) NOT NULL,
	orientation VARCHAR(50),
	blood_type VARCHAR(3) NOT NULL
);

CREATE TABLE Patient_PhysicalProfile (
	id BIGSERIAL PRIMARY KEY NOT NULL,
	height DECIMAL NOT NULL,
	weight DECIMAL NOT NULL,
	body_mass_index DECIMAL, -- body mass index can be calculated from height and weight
	allergies VARCHAR(100) NOT NULL
	-- allergic_reaction VARCHAR(255) NOT NULL -- subtable of allergies
);

CREATE TABLE Patient_Lifestyle (
	id BIGSERIAL PRIMARY KEY NOT NULL,
    FOREIGN KEY (body_mass_index) REFERENCES Patient_PhysicalProfile(body_mass_index),
	diet VARCHAR(100) NOT NULL,
	smoking VARCHAR(20) NOT NULL,
	drinking VARCHAR(20) NOT NULL,
	exercise VARCHAR(50) NOT NULL,
	sleeping VARCHAR(30) NOT NULL -- contains subtables for different sleep parameters
);

CREATE TABLE Patient_Records (
	id BIGSERIAL PRIMARY KEY NOT NULL,
    FOREIGN KEY (race_and_ethnicity) REFERENCES Patient_General(race_and_ethnicity),
	medical_history VARCHAR(100) NOT NULL, -- contains subtables
	medication_history VARCHAR(100) NOT NULL, -- contains subtables
	review_of_systems VARCHAR(100) NOT NULL, -- contains subtables
	family_history VARCHAR(100), -- contains subtables
	menstrual_history VARCHAR(100) -- contains subtables
);

CREATE TABLE Patient_Lifestyle2 (
	id BIGSERIAL PRIMARY KEY NOT NULL,
	FOREIGN KEY (gender) REFERENCES Patient_General(gender),
	occupation VARCHAR(50) NOT NULL,
	marital_status VARCHAR(30) NOT NULL,
	sexual_activity VARCHAR(30) NOT NULL,
	birth_control_method VARCHAR(25)
);

CREATE TABLE Patient_Stage1_Parameters (
	id BIGSERIAL PRIMARY KEY NOT NULL,
	FOREIGN KEY (body_mass_index)  REFERENCES Patient_PhysicalProfile(body_mass_index),
	FOREIGN KEY (medical_history) REFERENCES Patient_Records(medical_history),
	pulse VARCHAR(10) NOT NULL,
	oxygen_saturation VARCHAR(20) NOT NULL,
	blood_pressure VARCHAR(15) NOT NULL,
	body_temperature VARCHAR(25) NOT NULL,
	fall_detection VARCHAR(30) NOT NULL,
	cardiac_monitoring VARCHAR(30) NOT NULL,
	sleep_pattern VARCHAR(50) NOT NULL,
	respiratory_rate VARCHAR(20) NOT NULL,
	vertigo_mitigation VARCHAR(25) NOT NULL
);

CREATE TABLE Patient_Stage2_Parameters (
	id BIGSERIAL PRIMARY KEY NOT NULL,
	FOREIGN KEY (blood_pressure, body_temperature) REFERENCES Patient_Stage1_Parameters(blood_pressure, body_temperature),
	body_temperature VARCHAR(25) NOT NULL,
	consciousness_state VARCHAR(30) NOT NULL,
	seziure_indications VARCHAR(30) NOT NULL,
	stroke_indications VARCHAR(30) NOT NULL,
	pain_intensity_level VARCHAR(50) NOT NULL,
	blood_glucose_level VARCHAR(20) NOT NULL,
	sepsis_detection VARCHAR(25) NOT NULL,
	catabolic_muscle_loss VARCHAR(30) NOT NULL,
	electrolyte_imbalance VARCHAR(25) NOT NULL
);


-- subtables (Medical records, review of systems etc.)

--CREATE TABLE Patient_Medical_Records
-- (
-- 	id BIGSERIAL PRIMARY KEY NOT NULL,
-- 	PastDiseases_Illnesses text,
-- 	Surgeries_and_Complications text,
-- 	History_of_Trauma text
-- );

-- CREATE TABLE Patient_Review_of_Systems
-- (
-- 	id BIGSERIAL PRIMARY KEY NOT NULL,
-- 	General text,
-- 	HeadEarNoseThroat text,
-- 	Eyes text,
-- 	Respiratory text,
-- 	Cadiovascular text,
-- 	Endocrine text,
-- 	Muscular text,
-- 	Skin text,
-- 	Allergy_Immuno text,
-- 	Neurological text,
-- 	Hematological text,
-- 	Psychiatric text,
-- 	GeriartricGiants text
	
-- );