-- Main table for storing scancode results at the repo level
CREATE TABLE analysis.scancode_scan (
    scan_id SERIAL PRIMARY KEY,
    repo_id INTEGER NOT NULL REFERENCES augur_data.repo(repo_id),
    repo_path TEXT NOT NULL,
    tool_name TEXT,
    tool_version TEXT,
    scan_started TIMESTAMP,
    scan_ended TIMESTAMP,
    duration_seconds DOUBLE PRECISION,
    total_files INTEGER,
    total_dirs INTEGER,
    total_size BIGINT
);

-- Details for every file scanned in a repo
CREATE TABLE analysis.scancode_file (
    file_id SERIAL PRIMARY KEY,
    scan_id INTEGER REFERENCES analysis.scancode_scan(scan_id),
    path TEXT,
    name TEXT,
    extension TEXT,
    size BIGINT,
    date DATE,
    sha1 TEXT,
    md5 TEXT,
    sha256 TEXT,
    mime_type TEXT,
    file_type TEXT,
    programming_language TEXT,
    is_binary BOOLEAN,
    is_text BOOLEAN,
    is_archive BOOLEAN,
    is_media BOOLEAN,
    is_source BOOLEAN,
    is_script BOOLEAN,
    detected_license_expression TEXT,
    detected_license_expression_spdx TEXT,
    percentage_of_license_text DOUBLE PRECISION
);

-- Optional: Table to store detected copyrights
CREATE TABLE analysis.scancode_file_copyright (
    id SERIAL PRIMARY KEY,
    file_id INTEGER REFERENCES analysis.scancode_file(file_id),
    copyright TEXT,
    start_line INTEGER,
    end_line INTEGER
);

-- Optional: Table to store detected license holders
CREATE TABLE analysis.scancode_file_holder (
    id SERIAL PRIMARY KEY,
    file_id INTEGER REFERENCES analysis.scancode_file(file_id),
    holder TEXT,
    start_line INTEGER,
    end_line INTEGER
);

-- Optional: Table to store detected authors
CREATE TABLE analysis.scancode_file_author (
    id SERIAL PRIMARY KEY,
    file_id INTEGER REFERENCES analysis.scancode_file(file_id),
    author TEXT,
    start_line INTEGER,
    end_line INTEGER
);