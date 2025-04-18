-- Main scan metadata table
CREATE TABLE scancode.scancode_scan (
    scan_id SERIAL PRIMARY KEY,
    repo_id INTEGER NOT NULL REFERENCES augur_data.repo(repo_id) ON DELETE CASCADE,
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

-- Index to speed up scans by repo
CREATE INDEX idx_scancode_scan_repo_id ON scancode.scancode_scan(repo_id);

-- File-level details per scan
CREATE TABLE scancode.scancode_file (
    file_id SERIAL PRIMARY KEY,
    scan_id INTEGER NOT NULL REFERENCES scancode.scancode_scan(scan_id) ON DELETE CASCADE,
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

CREATE INDEX idx_scancode_file_scan_id ON scancode.scancode_file(scan_id);

-- Copyrights per file
CREATE TABLE scancode.scancode_file_copyright (
    id SERIAL PRIMARY KEY,
    file_id INTEGER NOT NULL REFERENCES scancode.scancode_file(file_id) ON DELETE CASCADE,
    copyright TEXT,
    start_line INTEGER,
    end_line INTEGER
);

-- License holders per file
CREATE TABLE scancode.scancode_file_holder (
    id SERIAL PRIMARY KEY,
    file_id INTEGER NOT NULL REFERENCES scancode.scancode_file(file_id) ON DELETE CASCADE,
    holder TEXT,
    start_line INTEGER,
    end_line INTEGER
);

-- Authors per file
CREATE TABLE scancode.scancode_file_author (
    id SERIAL PRIMARY KEY,
    file_id INTEGER NOT NULL REFERENCES scancode.scancode_file(file_id) ON DELETE CASCADE,
    author TEXT,
    start_line INTEGER,
    end_line INTEGER
);